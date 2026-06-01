import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/profile/data/DataSource/profile_remote_data_source.dart';
import 'package:canzo_app/feature/profile/domain/UseCase/update_profile_use_case.dart';
import 'package:canzo_app/feature/profile/domain/entity/profile_entity.dart';
import 'package:canzo_app/feature/profile/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl extends ProfileRepository{
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, ProfileEntity>> getProfile() {
   return _remoteDataSource.getProfile();
  }

  @override
  Future<Either<Failure, bool>> updateProfile(UpdateProfileParams params) {
    return _remoteDataSource.updateProfile(params);
  }

  @override
  Future<Either<Failure, ProfileEntity>> getAdminProfile() {
    return _remoteDataSource.getAdminProfile();
  }

  @override
  Future<Either<Failure, bool>> updateAdminProfile(UpdateProfileParams params) {
    return _remoteDataSource.updateAdminProfile(params);
  }
}