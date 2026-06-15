import 'package:canzo_app/core/api/api_consumer.dart';
import 'package:canzo_app/core/api/end_points.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/profile/data/model/profile_model.dart';
import 'package:canzo_app/feature/profile/domain/entity/profile_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/UseCase/update_profile_use_case.dart';

abstract class ProfileRemoteDataSource {
  Future<Either<Failure, ProfileEntity>> getProfile();

  Future<Either<Failure, ProfileEntity>> getAdminProfile();

  Future<Either<Failure, bool>> updateProfile(UpdateProfileParams params);

  Future<Either<Failure, bool>> updateAdminProfile(UpdateProfileParams params);
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiConsumer _apiConsumer;

  ProfileRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    var result = await _apiConsumer.get(
      EndPoints.profile,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return result.fold((failure) => Left(failure), (response) {
      if (response['profile'] == null) {
        return Left(ServerFailure('Profile not found'));
      }
      return Right(ProfileModel.fromJson(response['profile']));
    });
  }

  @override
  Future<Either<Failure, bool>> updateProfile(
    UpdateProfileParams params,
  ) async {
    var result = await _apiConsumer.patch(
      EndPoints.profile,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: params.toJson(),
    );

    return result.fold((failure) => Left(failure), (response) {
      return Right(true);
    });
  }

  @override
  Future<Either<Failure, ProfileEntity>> getAdminProfile() async {
    var result = await _apiConsumer.get(
      EndPoints.adminProfile,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return result.fold((failure) => Left(failure), (response) {
      return Right(ProfileModel.fromJson(response['profile']));
    });
  }

  @override
  Future<Either<Failure, bool>> updateAdminProfile(
    UpdateProfileParams params,
  ) async {
    var result = await _apiConsumer.patch(
      EndPoints.adminProfile,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: params.toJson(),
    );

    return result.fold((failure) => Left(failure), (response) {
      return Right(true);
    });
  }
}
