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

  BasketEntity copyWith({
    int? id,
    String? contentType,
    int? contentWeight,
    int? isFull,
  }) {
    return BasketEntity(
      id: id ?? this.id,
      contentType: contentType ?? this.contentType,
      contentWeight: contentWeight ?? this.contentWeight,
      isFull: isFull ?? this.isFull,
    );
  }
}
