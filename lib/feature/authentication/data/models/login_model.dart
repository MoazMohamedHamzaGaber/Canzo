import 'package:canzo_app/feature/authentication/domain/entity/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.message, required super.token, required super.userId, required super.userRole});

  factory LoginModel.fromJson(Map<String,dynamic> json){
    return LoginModel(
      message:  json['message'] ??'',
      token: json['token'] ??'',
      userId: json['user']['id'] ??0,
      userRole: json['user']['user_role'] ??'',
    );
  }
}