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

import '../../../../core/utils/const.dart';
import '../../domain/cases/google_login_use_case.dart';
import '../../domain/cases/set_up_profile_use_case.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, bool>> signUp(SignUpParams params);

  Future<Either<Failure, LoginEntity>> signIn(SignInParams params);

  Future<Either<Failure, bool>> forgetPassword(ForgetPasswordParams params);

  Future<Either<Failure, VerifyEntity>> verifyOtp(VerifyOtpParams params);

  Future<Either<Failure, bool>> resetPasswordPassword(
    ResetPasswordParams params,
  );
  Future<Either<Failure, bool>> setupProfile(
      SetupProfileParams params,
      );
  Future<Either<Failure, LoginEntity>> googleLogin(GoogleLoginParams params);
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
  Future<Either<Failure, bool>> forgetPassword(
    ForgetPasswordParams params,
  ) async {
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
  Future<Either<Failure, bool>> resetPasswordPassword(
    ResetPasswordParams params,
  ) async {
    var result = await _apiConsumer.patch(
      EndPoints.resetPassword,
      options: Options(),
      data: params.toJson(),
    );

    return result.fold((failure) => Left(failure), (response) {
      return Right(true);
    });
  }

  @override
  Future<Either<Failure, VerifyEntity>> verifyOtp(
    VerifyOtpParams params,
  ) async {
    var result = await _apiConsumer.post(
      EndPoints.verifyOtp,
      options: Options(),
      data: params.toJson(),
    );

    return result.fold((failure) => Left(failure), (response) {
      return Right(VerifyModel.fromJson(response));
    });
  }

  @override
  Future<Either<Failure, LoginEntity>> googleLogin(
    GoogleLoginParams params,
  ) async {
    var result = await _apiConsumer.post(
      EndPoints.googleLogin,
      options: Options(),
      data: params.toJson(),
    );

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(LoginModel.fromJson(response)),
    );
  }

  @override
  Future<Either<Failure, bool>> setupProfile(
      SetupProfileParams params,
      ) async {
    print('TOKEN => $token');
    print('BODY => ${params.toJson()}');

    final result = await _apiConsumer.post(
      EndPoints.setupProfile,
      data: params.toJson(),
      options: Options(
        headers: {
          'Authorization': 'Token $token',
        },
      ),
    );

    return result.fold(
          (failure) {
        print('SETUP PROFILE FAILED => ${failure.errMessage}');
        return Left(failure);
      },
          (response) {
        print('SETUP PROFILE RESPONSE => $response');
        return const Right(true);
      },
    );
  }
}
