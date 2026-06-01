import 'package:dartz/dartz.dart';

import '../../../../../core/abstract/use_case.dart';
import '../../../../../core/error/failure.dart';
import '../entity/order_entity.dart';
import '../repository/overview_repository.dart';

class GetOrdersUseCase extends UseCase<List<OrderEntity>, NoParams> {
  final OverviewRepository repository;

  GetOrdersUseCase(this.repository);

  @override
  Future<Either<Failure, List<OrderEntity>>> call(NoParams params) {
    return repository.getOrders();
  }
}
