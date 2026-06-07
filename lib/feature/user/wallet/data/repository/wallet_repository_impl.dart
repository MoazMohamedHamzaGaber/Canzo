import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/user/wallet/data/DataSource/wallet_remote_data_source.dart';
import 'package:canzo_app/feature/user/wallet/domain/entity/transaction_entity.dart';
import 'package:canzo_app/feature/user/wallet/domain/entity/wallet_entity.dart';
import 'package:canzo_app/feature/user/wallet/domain/entity/withdraw_entity.dart';
import 'package:canzo_app/feature/user/wallet/domain/repository/wallet_repository.dart';
import 'package:dartz/dartz.dart';

class WalletRepositoryImpl extends WalletRepository {
  final WalletRemoteDataSource _remoteDataSource;

  WalletRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, TransactionEntity>> getTransaction() {
    return _remoteDataSource.getTransaction();
  }

  @override
  Future<Either<Failure, WalletEntity>> getWallet() {
    return _remoteDataSource.getWallet();
  }

  @override
  Future<Either<Failure, List<WithdrawUserEntity>>> getWithdraw() {
    return _remoteDataSource.getWithdraw();
  }
}