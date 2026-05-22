import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/user/wallet/domain/entity/transaction_entity.dart';
import 'package:canzo_app/feature/user/wallet/domain/entity/wallet_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WalletRepository {
  Future<Either<Failure,TransactionEntity>> getTransaction();
  Future<Either<Failure,WalletEntity>> getWallet();
}