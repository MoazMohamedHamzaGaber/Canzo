import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteAccountUseCase extends UseCase<bool, NoParams> {
  final AuthRepository _repository;

  DeleteAccountUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await _repository.deleteAccount();
  }
}