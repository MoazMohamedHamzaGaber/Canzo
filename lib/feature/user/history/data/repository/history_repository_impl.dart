import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/user/history/data/DataSource/history_remote_data_source.dart';
import 'package:canzo_app/feature/user/history/domain/entity/order_status_entity.dart';
import 'package:canzo_app/feature/user/history/domain/repository/history_repository.dart';
import 'package:dartz/dartz.dart';

class HistoryRepositoryImpl extends HistoryRepository{
  final HistoryRemoteDataSource _remoteDataSource;

  HistoryRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, List<OrderStatusEntity>>> getOrderStatus(String status) {
    return _remoteDataSource.getOrderStatus(status);
  }
}