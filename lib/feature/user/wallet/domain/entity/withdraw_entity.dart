class WithdrawUserEntity {
  final int id;
  final int userId;
  final int amount;
  final String status;
  final int? adminId;
  final String? screenshotPath;
  final String walletNumber;
  final String createdAt;
  final String updatedAt;

  const WithdrawUserEntity({
    required this.id,
    required this.userId,
    required this.amount,
    required this.status,
    this.adminId,
    this.screenshotPath,
    required this.walletNumber,
    required this.createdAt,
    required this.updatedAt,
  });
}