import 'package:canzo_app/feature/user/history/domain/entity/order_status_entity.dart';

class OrderStatusModel extends OrderStatusEntity {
  OrderStatusModel({
    required super.id,
    required super.status,
    required super.createdAt,
    required super.address,
    required super.totalBaskets,
    required super.totalWeight,
    required super.plasticCount,
    required super.canzCount,
    required super.price,
    required super.contentType,
    required super.contentWeight,
  });

  factory OrderStatusModel.fromJson(Map<String, dynamic> json) {
    return OrderStatusModel(
      id: json['id'] ?? 0,
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      address: json['address'] ?? '',
      totalBaskets: json['total_baskets'] ?? 0,
      totalWeight: json['total_weight'] ??0,
      plasticCount: json['plastic_count'] ??0,
      canzCount: json['canz_count'] ??0,
      price: json['price'] ??0,
      contentType: json['content_type'] ??0,
      contentWeight: json['content_weight'] ??0,
    );
  }
}
