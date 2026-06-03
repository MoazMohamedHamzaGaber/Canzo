import 'package:dartz/dartz.dart';

import '../../../../../core/abstract/use_case.dart';
import '../../../../../core/error/failure.dart';
import '../entity/wallet_entity.dart';
import '../repository/overview_repository.dart';

class GetWalletAdminUseCase extends UseCase<WalletAdminEntity, NoParams> {
  final OverviewRepository repository;

  GetWalletAdminUseCase(this.repository);

  @override
  Future<Either<Failure, WalletAdminEntity>> call(NoParams params) {
    return repository.getWallet();
  }
}
