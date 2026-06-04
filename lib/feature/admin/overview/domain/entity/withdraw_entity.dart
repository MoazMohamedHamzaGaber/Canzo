class WithdrawalEntity {
  final int id;
  final int userId;
  final double amount;
  final String status;
  final int? adminId;
  final String? screenshotPath;
  final String walletNumber;
  final String createdAt;
  final String updatedAt;
  final String userName;
  final String phoneNumber;

  const WithdrawalEntity({
    required this.id,
    required this.userId,
    required this.amount,
    required this.status,
    this.adminId,
    this.screenshotPath,
    required this.walletNumber,
    required this.createdAt,
    required this.updatedAt,
    required this.userName,
    required this.phoneNumber,
  });
}