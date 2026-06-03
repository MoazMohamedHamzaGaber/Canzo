import '../../domain/entity/wallet_entity.dart';

class WalletAdminModel extends WalletAdminEntity {
  WalletAdminModel({
    required super.clientCount,
    required super.completedOrdersCount,
    required super.totalSpends,
  });

  factory WalletAdminModel.fromJson(Map<String, dynamic> json){
    return WalletAdminModel(
      clientCount: json['clientCount'] ?? 0,
      completedOrdersCount: json['completedOrdersCount'] ?? 0,
      totalSpends: json['totalSpends'] ?? 0,
    );
  }
}
