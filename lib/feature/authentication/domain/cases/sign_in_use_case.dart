import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/authentication/domain/cases/params.dart';
import 'package:canzo_app/feature/authentication/domain/entity/login_entity.dart';
import 'package:canzo_app/feature/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignInUseCases extends UseCase<LoginEntity, SignInParams> {
  final AuthRepository _authRepository;

  SignInUseCases(this._authRepository);

  @override
  Future<Either<Failure, LoginEntity>> call(SignInParams params) async {
    return await _authRepository.signIn(params);
  }
}