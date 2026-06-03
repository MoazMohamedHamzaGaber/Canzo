class WalletAdminEntity {
  final int clientCount;
  final int completedOrdersCount;
  final int totalSpends;

  WalletAdminEntity({
    required this.clientCount,
    required this.completedOrdersCount,
    required this.totalSpends,
  });
}
