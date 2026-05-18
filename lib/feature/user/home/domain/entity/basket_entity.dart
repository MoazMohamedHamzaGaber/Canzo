class BasketEntity {
  final int id;
  final String contentType;
  final int contentWeight;
  final int isFull;

  BasketEntity({
    required this.id,
    required this.contentType,
    required this.contentWeight,
    required this.isFull,
  });
}
