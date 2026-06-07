import '../../domain/entity/withdraw_entity.dart';

class WithdrawUserModel extends WithdrawUserEntity {
  const WithdrawUserModel({
    required super.id,
    required super.userId,
    required super.amount,
    required super.status,
    super.adminId,
    super.screenshotPath,
    required super.walletNumber,
    required super.createdAt,
    required super.updatedAt,
  });

  factory WithdrawUserModel.fromJson(Map<String, dynamic> json) {
    return WithdrawUserModel(
      id: json['id'],
      userId: json['user_id'],
      amount: json['amount'],
      status: json['status'],
      adminId: json['admin_id'],
      screenshotPath: json['screenshot_path'],
      walletNumber: json['wallet_number'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'amount': amount,
      'status': status,
      'admin_id': adminId,
      'screenshot_path': screenshotPath,
      'wallet_number': walletNumber,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}