import 'package:canzo_app/feature/authentication/domain/entity/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.message, required super.token, required super.userId, required super.userRole, required super.isFirstLogin});

  factory LoginModel.fromJson(Map<String,dynamic> json){
    return LoginModel(
      message:  json['message'] ??'',
      token: json['token'] ??'',
      userId: json['user']?['id'] ??json['id'] ??0,
      userRole: json['user']?['user_role'] ??json['user_role'] ??'',
      isFirstLogin: json['isFirstLogin']??false,
    );
  }
}