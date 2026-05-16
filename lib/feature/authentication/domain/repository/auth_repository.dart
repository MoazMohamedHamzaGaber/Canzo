import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/authentication/domain/cases/params.dart';
import 'package:canzo_app/feature/authentication/domain/entity/login_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository{
  Future<Either<Failure,bool>> signUp(SignUpParams params);
  Future<Either<Failure,LoginEntity>> signIn(SignInParams params);
}