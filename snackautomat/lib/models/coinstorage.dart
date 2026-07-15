class CoinStorage {
  final Map<int, int> coins;

  CoinStorage({required this.coins});

  void addCoins(Map<int, int> insertedCoins) {
    insertedCoins.forEach((coinValue, amount) {
      coins[coinValue] = (coins[coinValue] ?? 0) + amount;
    });
  }
}
