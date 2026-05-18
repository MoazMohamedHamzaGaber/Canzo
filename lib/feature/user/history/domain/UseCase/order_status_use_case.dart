import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/user/history/domain/entity/order_status_entity.dart';
import 'package:canzo_app/feature/user/history/domain/repository/history_repository.dart';
import 'package:dartz/dartz.dart';

class OrderStatusUseCase extends UseCase<List<OrderStatusEntity>, String> {
  final HistoryRepository _historyRepository;

  OrderStatusUseCase(this._historyRepository);

  @override
  Future<Either<Failure, List<OrderStatusEntity>>> call(String status) async {
    return await _historyRepository.getOrderStatus(status);
  }
}