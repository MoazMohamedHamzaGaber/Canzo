import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/authentication/domain/cases/params.dart';
import 'package:canzo_app/feature/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class ForgetPasswordUseCase extends UseCase<bool, ForgetPasswordParams> {
  final AuthRepository _authRepository;

  ForgetPasswordUseCase(this._authRepository);

  @override
  Future<Either<Failure, bool>> call(ForgetPasswordParams params) async {
    return await _authRepository.forgetPassword(params);
  }
}