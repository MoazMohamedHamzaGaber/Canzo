import 'package:schoolix_app/feature/Login/domain/entities/login.dart';

class LoginModel extends LoginEntity{
  const LoginModel({required super.authToken,super.refreshToken});

  factory LoginModel.fromJson(Map<String,dynamic> json){
   return LoginModel(
       authToken:  json['auth_token'] ??'',
     refreshToken: json['refresh_token'],
   );
  }

  // Map<String,dynamic> toJson(){
  //   return {
  //     'auth_token': authToken
  //   };
  // }
}