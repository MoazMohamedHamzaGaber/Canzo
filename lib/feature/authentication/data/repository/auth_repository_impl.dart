import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/authentication/domain/cases/params.dart';
import 'package:canzo_app/feature/authentication/domain/entity/login_entity.dart';
import 'package:canzo_app/feature/authentication/domain/entity/verify_entity.dart';
import 'package:canzo_app/feature/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../DataSource/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository{

  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);


  @override
  Future<Either<Failure, bool>> signUp(SignUpParams params) {
      return _remoteDataSource.signUp(params);
  }

  @override
  Future<Either<Failure, LoginEntity>> signIn(SignInParams params) {
    return _remoteDataSource.signIn(params);
  }

  @override
  Future<Either<Failure, bool>> forgetPassword(ForgetPasswordParams params) {
    return _remoteDataSource.forgetPassword(params);
  }

  @override
  Future<Either<Failure, bool>> resetPasswordPassword(ResetPasswordParams params) {
    return _remoteDataSource.resetPasswordPassword(params);
  }

  @override
  Future<Either<Failure, VerifyEntity>> verifyOtp(VerifyOtpParams params) {
    return _remoteDataSource.verifyOtp(params);
  }
}