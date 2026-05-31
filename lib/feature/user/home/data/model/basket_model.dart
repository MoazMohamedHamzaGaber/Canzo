import 'package:canzo_app/feature/user/home/domain/entity/basket_entity.dart';

class BasketModel extends BasketEntity {
  BasketModel({required super.contentType, required super.contentWeight, required super.isFull, required super.id, required super.price});

  factory BasketModel.fromJson(Map<String,dynamic> json){
    return BasketModel(
      id:  json['id'] ??0,
      contentType:  json['content_type'] ??'',
      contentWeight: json['content_weight'] ??0,
      price: json['price'] ??0,
      isFull: json['is_full']??0,
    );
  }
}
