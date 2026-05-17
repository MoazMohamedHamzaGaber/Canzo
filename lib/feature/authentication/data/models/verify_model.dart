import 'package:canzo_app/feature/authentication/domain/entity/verify_entity.dart';

class VerifyModel extends VerifyEntity {
  VerifyModel({required super.message, required super.resetToken});

  factory VerifyModel.fromJson(Map<String,dynamic> json){
    return VerifyModel(
      message:  json['message'] ??'',
      resetToken: json['resetToken'] ??'',
    );
  }
}