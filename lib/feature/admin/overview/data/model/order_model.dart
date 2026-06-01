import '../../domain/entity/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.id,
    required super.userName,
    required super.address,
    required super.phoneNumber,
    required super.createdAt,
    required super.status,
    required super.basketsCount,
    required super.totalWeight,
    required super.plasticCount,
    required super.canzCount, required super.price,
  });

  factory OrderModel.fromJson(
      Map<String,dynamic> json,
      ) {
    return OrderModel(
      id: json['id'],
      price: json['price'] ??0,
      userName: json['user_name'],
      address: json['address'],
      phoneNumber: json['phone_number'],
      createdAt: json['created_at'],
      status: json['status'],
      totalWeight:
      (json['total_weight'] as num?)?.toDouble() ?? 0.0,
      plasticCount: json['plastic_count'] ?? 0,

      canzCount: json['canz_count'] ?? 0,

      basketsCount: json['baskets_count'] ?? 0,
    );
  }
}