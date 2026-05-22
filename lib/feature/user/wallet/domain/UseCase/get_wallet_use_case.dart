import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/user/wallet/domain/entity/wallet_entity.dart';
import 'package:canzo_app/feature/user/wallet/domain/repository/wallet_repository.dart';
import 'package:dartz/dartz.dart';

class GetWalletUseCase extends UseCase<WalletEntity, NoParams> {
  final WalletRepository _walletRepository;

  GetWalletUseCase(this._walletRepository);

  @override
  Future<Either<Failure, WalletEntity>> call(NoParams params) async {
    return await _walletRepository.getWallet();
  }
}