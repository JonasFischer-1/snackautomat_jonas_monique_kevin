import 'package:snackautomat/models/coinstorage.dart';
import 'package:snackautomat/models/slot.dart';

class VendingMachine {
  final List<Slot> slots;
  Slot? selectedSlot;
  final Map<int, int> currentBalance;
  final CoinStorage coinStorage;
  int changeInCent = 0;

  VendingMachine({
    required this.slots,
    this.selectedSlot,
    required this.currentBalance,
    required this.coinStorage,
  });

  bool selectSlot(String slotId) {
    for (final slot in slots) {
      if (slot.id == slotId) {
        selectedSlot = slot;
        return true;
      }
    }

    selectedSlot = null;
    return false;
  }

  int calculateCurrentBalance() {
    int sum = 0;
    currentBalance.forEach((coinValue, amount) {
      sum += coinValue * amount;
    });
    return sum;
  }

  int calculateChange() {
    if (selectedSlot == null) {
      return 0;
    }

    return calculateCurrentBalance() - selectedSlot!.product.priceInCent;
  }

  bool canBuyProduct() {
    if (selectedSlot == null) {
      return false;
    }
    if (selectedSlot!.bestand <= 0) {
      return false;
    }
    return calculateCurrentBalance() >= selectedSlot!.product.priceInCent;
  }

  bool buyProduct() {
    if (!canBuyProduct()) {
      return false;
    }

    changeInCent = calculateChange();
    coinStorage.addCoins(currentBalance);
    currentBalance.clear();
    selectedSlot!.bestand--;

    return true;
  }

  void insertCoin(int coinValue) {
    currentBalance[coinValue] = (currentBalance[coinValue] ?? 0) + 1;
  }

  Map<int, int> returnInsertedCoins() {
    final returnedCoins = Map<int, int>.from(currentBalance);

    currentBalance.clear();
    selectedSlot = null;

    return returnedCoins;
  }
}

//Summe startet bei 0.
//Automat geht jede Münzart durch.
//Pro Münzart: Münzwert × Anzahl.
//Ergebnis wird zur Summe addiert.
//Am Ende kommt die Summe raus.
