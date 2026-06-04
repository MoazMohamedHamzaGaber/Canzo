import 'package:canzo_app/feature/admin/overview/domain/entity/wallet_entity.dart';
import 'package:canzo_app/feature/admin/overview/domain/entity/withdraw_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../domain/entity/order_entity.dart';
import '../../domain/repository/overview_repository.dart';
import '../../domain/useCase/update_order_use_case.dart';
import '../data_source/overview_remote_data_source.dart';

class OverviewRepositoryImpl implements OverviewRepository {
  final OverviewRemoteDataSource remote;

  OverviewRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() {
    return remote.getOrders();
  }

  @override
  Future<Either<Failure, String>> updateOrder(UpdateOrderParams params) {
    return remote.updateOrder(params);
  }

  @override
  Future<Either<Failure, WalletAdminEntity>> getWallet() {
    return remote.getWallet();
  }

  @override
  Future<Either<Failure, List<WithdrawalEntity>>> getWithdraw() {
    return remote.getWithdraw();
  }
}
