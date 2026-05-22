import 'package:canzo_app/core/api/api_consumer.dart';
import 'package:canzo_app/core/api/end_points.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/user/wallet/data/model/transaction_model.dart';
import 'package:canzo_app/feature/user/wallet/data/model/wallet_model.dart';
import 'package:canzo_app/feature/user/wallet/domain/entity/transaction_entity.dart';
import 'package:canzo_app/feature/user/wallet/domain/entity/wallet_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class WalletRemoteDataSource {
  Future<Either<Failure,TransactionEntity>> getTransaction();
  Future<Either<Failure,WalletEntity>> getWallet();
}

class WalletRemoteDataSourceImpl implements WalletRemoteDataSource {
  final ApiConsumer _apiConsumer;

  WalletRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<Either<Failure, TransactionEntity>> getTransaction() async {
    var result = await _apiConsumer.get(
      EndPoints.transaction,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return result.fold((failure) => Left(failure), (response) {
      return Right(TransactionModel.fromJson(response));
    });
  }

  @override
  Future<Either<Failure, WalletEntity>> getWallet() async {
    var result = await _apiConsumer.get(
      EndPoints.wallet,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return result.fold((failure) => Left(failure), (response) {
      return Right(WalletModel.fromJson(response['wallet']));
    });
  }
}
