import 'package:canzo_app/feature/authentication/domain/entity/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.message, required super.token});

  factory LoginModel.fromJson(Map<String,dynamic> json){
    return LoginModel(
      message:  json['message'] ??'',
      token: json['token'],
    );
  }
}