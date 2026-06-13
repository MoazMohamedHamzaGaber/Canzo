import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/authentication/domain/cases/params.dart';
import 'package:canzo_app/feature/authentication/domain/entity/login_entity.dart';
import 'package:canzo_app/feature/authentication/domain/entity/verify_entity.dart';
import 'package:dartz/dartz.dart';

import '../cases/google_login_use_case.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> signUp(SignUpParams params);

  Future<Either<Failure, LoginEntity>> signIn(SignInParams params);

  Future<Either<Failure, bool>> forgetPassword(ForgetPasswordParams params);

  Future<Either<Failure, VerifyEntity>> verifyOtp(VerifyOtpParams params);

  Future<Either<Failure, bool>> resetPasswordPassword(
    ResetPasswordParams params,
  );

  Future<Either<Failure, LoginEntity>> googleLogin(GoogleLoginParams params);
}
