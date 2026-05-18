import 'package:canzo_app/feature/user/history/domain/entity/order_status_entity.dart';

class OrderStatusModel extends OrderStatusEntity {
  OrderStatusModel({
    required super.id,
    required super.clientId,
    required super.status,
    required super.createdAt,
  });

  factory OrderStatusModel.fromJson(Map<String,dynamic> json){
    return OrderStatusModel(
      id:  json['id'] ??0,
      clientId:  json['string'] ??0,
      status: json['string'] ??'',
      createdAt: json['created_at']??'',
    );
  }
}
