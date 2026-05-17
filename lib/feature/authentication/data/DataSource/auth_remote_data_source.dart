import 'package:canzo_app/core/api/api_consumer.dart';
import 'package:canzo_app/core/api/end_points.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/authentication/data/models/login_model.dart';
import 'package:canzo_app/feature/authentication/data/models/verify_model.dart';
import 'package:canzo_app/feature/authentication/domain/cases/params.dart';
import 'package:canzo_app/feature/authentication/domain/entity/login_entity.dart';
import 'package:canzo_app/feature/authentication/domain/entity/verify_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, bool>> signUp(SignUpParams params);

  Future<Either<Failure, LoginEntity>> signIn(SignInParams params);
  Future<Either<Failure,bool>> forgetPassword(ForgetPasswordParams params);
  Future<Either<Failure,VerifyEntity>> verifyOtp(VerifyOtpParams params);
  Future<Either<Failure,bool>> resetPasswordPassword(ResetPasswordParams params);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer _apiConsumer;

  AuthRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<Either<Failure, bool>> signUp(SignUpParams params) async {
    var result = await _apiConsumer.post(
      EndPoints.signup,
      options: Options(),
      data: params.toJson(),
    );

    return result.fold((failure) => Left(failure), (response) {
      return Right(true);
    });
  }

  @override
  Future<Either<Failure, LoginEntity>> signIn(SignInParams params) async {
    var result = await _apiConsumer.post(
      EndPoints.signIn,
      options: Options(),
      data: params.toJson(),
    );

    return result.fold((failure) => Left(failure), (response) {
      return Right(LoginModel.fromJson(response));
    });
  }

  @override
  Future<Either<Failure, bool>> forgetPassword(ForgetPasswordParams params) async {
    var result = await _apiConsumer.post(
      EndPoints.forgetPassword,
      options: Options(),
      data: params.toJson(),
    );

    return result.fold((failure) => Left(failure), (response) {
      return Right(true);
    });
  }

  @override
  Future<Either<Failure, bool>> resetPasswordPassword(ResetPasswordParams params) async {
    var result = await _apiConsumer.post(
      EndPoints.resetPassword,
      options: Options(),
      data: params.toJson(),
    );

    return result.fold((failure) => Left(failure), (response) {
      return Right(true);
    });
  }

  @override
  Future<Either<Failure, VerifyEntity>> verifyOtp(VerifyOtpParams params) async {
    var result = await _apiConsumer.post(
      EndPoints.verifyOtp,
      options: Options(),
      data: params.toJson(),
    );

    return result.fold((failure) => Left(failure), (response) {
      return Right(VerifyModel.fromJson(response));
    });
  }
}
