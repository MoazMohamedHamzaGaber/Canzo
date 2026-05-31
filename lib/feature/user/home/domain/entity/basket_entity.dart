class BasketEntity {
  final int id;
  final String contentType;
  final int contentWeight;
  final int price;
  final int isFull;

  BasketEntity({
    required this.id,
    required this.contentType,
    required this.contentWeight,
    required this.isFull, required this.price,
  });

  BasketEntity copyWith({
    int? id,
    String? contentType,
    int? contentWeight,
    int? isFull,
    int? price,
  }) {
    return BasketEntity(
      id: id ?? this.id,
      contentType: contentType ?? this.contentType,
      price: price ?? this.price,
      contentWeight: contentWeight ?? this.contentWeight,
      isFull: isFull ?? this.isFull,
    );
  }
}
