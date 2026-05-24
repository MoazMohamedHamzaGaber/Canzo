import 'package:canzo_app/feature/profile/domain/entity/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    required super.email,
    required super.userName,
    required super.userRole,
    required super.phone,
    required super.address,
    required super.activityName,
    required super.activityType,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      email: json['email'] ??'',
      userName: json['username'] ??'',
      userRole: json['user_role'] ??'',
      phone: json['phoneNumber'] ??'',
      address: json['address'] ??'',
      activityName: json['activityName'] ??'',
      activityType: json['activityType'] ??'',
    );
  }
}
