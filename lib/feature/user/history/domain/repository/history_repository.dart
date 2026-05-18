import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/user/history/domain/entity/order_status_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HistoryRepository {
  Future<Either<Failure,List<OrderStatusEntity>>> getOrderStatus(String status);
}