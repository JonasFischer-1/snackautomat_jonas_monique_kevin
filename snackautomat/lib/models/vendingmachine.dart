import 'package:snackautomat/models/coinstorage.dart';
import 'package:snackautomat/models/slot.dart';

class VendingMachine {
  final List<Slot> slots;
  final Slot? selectedSlot;
  final Map<int, int> currentBalance;
  final CoinStorage coinStorage;

  VendingMachine({
    required this.slots,
    required this.selectedSlot,
    required this.currentBalance,
    required this.coinStorage,
  });
}



//Summe startet bei 0.
//Automat geht jede Münzart durch.
//Pro Münzart: Münzwert × Anzahl.
//Ergebnis wird zur Summe addiert.
//Am Ende kommt die Summe raus.