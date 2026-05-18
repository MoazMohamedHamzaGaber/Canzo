class OrderStatusEntity {
  final int id;
  final int clientId;
  final String status;
  final String createdAt;

  OrderStatusEntity({
    required this.id,
    required this.clientId,
    required this.status,
    required this.createdAt,
  });
}
