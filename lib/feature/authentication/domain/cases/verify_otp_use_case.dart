import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/authentication/domain/cases/params.dart';
import 'package:canzo_app/feature/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class VerifyOtpUseCase extends UseCase<bool, VerifyOtpParams> {
  final AuthRepository _authRepository;

  VerifyOtpUseCase(this._authRepository);

  @override
  Future<Either<Failure, bool>> call(VerifyOtpParams params) async {
    return await _authRepository.verifyOtp(params);
  }
}