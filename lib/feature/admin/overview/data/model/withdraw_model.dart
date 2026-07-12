import '../../domain/entity/withdraw_entity.dart';

class WithdrawalModel extends WithdrawalEntity {
  const WithdrawalModel({
    required super.id,
    required super.userId,
    required super.amount,
    required super.status,
    super.adminId,
    super.screenshotPath,
    required super.walletNumber,
    required super.walletType,
    required super.createdAt,
    required super.updatedAt,
    required super.userName,
    required super.phoneNumber,
  });

  factory WithdrawalModel.fromJson(Map<String, dynamic> json) {
    return WithdrawalModel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      amount: (json['amount'] ?? 0).toDouble(),
      status: json['status'] ?? '',
      adminId: json['admin_id'],
      screenshotPath: json['screenshot_path'],
      walletNumber: json['wallet_number'] ?? '',
      walletType: json['wallet_type'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      userName: json['user_name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
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
      'wallet_type': walletType,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'user_name': userName,
      'phone_number': phoneNumber,
    };
  }
}