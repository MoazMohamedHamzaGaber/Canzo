class OrderStatusEntity {
  final int id;
  final String status;
  final String createdAt;
  final String address;
  final int totalBaskets;
  final int totalWeight;
  final int plasticCount;
  final int canzCount;
  final int price;

  OrderStatusEntity({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.address,
    required this.totalBaskets,
    required this.totalWeight,
    required this.plasticCount,
    required this.canzCount,
    required this.price,
  });
}
