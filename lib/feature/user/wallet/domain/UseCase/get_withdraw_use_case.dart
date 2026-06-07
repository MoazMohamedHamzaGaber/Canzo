import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/user/wallet/domain/repository/wallet_repository.dart';
import 'package:dartz/dartz.dart';

import '../entity/withdraw_entity.dart';

class GetWithdrawUseCase extends UseCase<List<WithdrawUserEntity>, NoParams> {
  final WalletRepository _walletRepository;

  GetWithdrawUseCase(this._walletRepository);

  @override
  Future<Either<Failure, List<WithdrawUserEntity>>> call(NoParams params) async {
    return await _walletRepository.getWithdraw();
  }
}