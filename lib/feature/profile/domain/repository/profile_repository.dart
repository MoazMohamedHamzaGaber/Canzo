import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/profile/domain/UseCase/update_profile_use_case.dart';
import 'package:canzo_app/feature/profile/domain/entity/profile_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure,ProfileEntity>> getProfile();
  Future<Either<Failure,ProfileEntity>> getAdminProfile();
  Future<Either<Failure,bool>> updateProfile(UpdateProfileParams params);
  Future<Either<Failure,bool>> updateAdminProfile(UpdateProfileParams params);
}