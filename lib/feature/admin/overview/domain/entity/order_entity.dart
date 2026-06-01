class OrderEntity {
  final int id;
  final int price;
  final String userName;
  final String address;
  final String phoneNumber;
  final String createdAt;
  final String status;
  final int basketsCount;
  final double? totalWeight;
  final int plasticCount;
  final int canzCount;

  const OrderEntity({
    required this.id,
    required this.price,
    required this.userName,
    required this.address,
    required this.phoneNumber,
    required this.createdAt,
    required this.status,
    required this.basketsCount,
    required this.totalWeight,
    required this.plasticCount,
    required this.canzCount,
  });
}