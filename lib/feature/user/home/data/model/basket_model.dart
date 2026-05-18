import 'package:canzo_app/feature/user/home/domain/entity/basket_entity.dart';

class BasketModel extends BasketEntity {
  BasketModel({required super.contentType, required super.contentWeight, required super.isFull});

  factory BasketModel.fromJson(Map<String,dynamic> json){
    return BasketModel(
      contentType:  json['content_type'] ??'',
      contentWeight: json['content_weight'] ??'',
      isFull: json['is_full']??0,
    );
  }
}
