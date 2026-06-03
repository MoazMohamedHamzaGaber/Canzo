import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../entity/order_entity.dart';
import '../entity/wallet_entity.dart';
import '../useCase/update_order_use_case.dart';

abstract class OverviewRepository {
  Future<Either<Failure, List<OrderEntity>>> getOrders();
  Future<Either<Failure, WalletAdminEntity>> getWallet();

  Future<Either<Failure, String>> updateOrder(UpdateOrderParams params);
}
