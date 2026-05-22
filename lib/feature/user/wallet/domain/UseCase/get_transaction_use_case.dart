import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/user/wallet/domain/entity/transaction_entity.dart';
import 'package:canzo_app/feature/user/wallet/domain/repository/wallet_repository.dart';
import 'package:dartz/dartz.dart';

class GetTransactionUseCase extends UseCase<TransactionEntity, NoParams> {
  final WalletRepository _walletRepository;

  GetTransactionUseCase(this._walletRepository);

  @override
  Future<Either<Failure, TransactionEntity>> call(NoParams params) async {
    return await _walletRepository.getTransaction();
  }
}