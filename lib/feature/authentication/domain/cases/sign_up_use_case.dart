import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/authentication/domain/cases/params.dart';
import 'package:canzo_app/feature/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignUpUseCases extends UseCase<bool, SignUpParams> {
  final AuthRepository _authRepository;

  SignUpUseCases(this._authRepository);

  @override
  Future<Either<Failure, bool>> call(SignUpParams params) async {
    return await _authRepository.signUp(params);
  }
}

