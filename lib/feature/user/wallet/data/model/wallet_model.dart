import 'package:canzo_app/feature/user/wallet/domain/entity/wallet_entity.dart';

class WalletModel extends WalletEntity {
  WalletModel({required super.balance});
  factory WalletModel.fromJson(Map<String, dynamic> json){
    return WalletModel(
      balance: json['balance'] ?? 0,
    );
  }
}