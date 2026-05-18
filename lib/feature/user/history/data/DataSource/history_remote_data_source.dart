import 'package:canzo_app/core/api/api_consumer.dart';
import 'package:canzo_app/core/api/end_points.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/user/history/data/model/order_status_model.dart';
import 'package:canzo_app/feature/user/history/domain/entity/order_status_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class HistoryRemoteDataSource {
  Future<Either<Failure,List<OrderStatusEntity>>> getOrderStatus(String status);
}

class HistoryRemoteDataSourceImpl extends HistoryRemoteDataSource{
  final ApiConsumer _apiConsumer;

  HistoryRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<Either<Failure, List<OrderStatusEntity>>> getOrderStatus(String status) async {
    var result = await _apiConsumer.patch(
      EndPoints.orderStatus(status),
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return result.fold((failure) => Left(failure), (response) {
      final list = (response['orders'] as List)
          .map((e) => OrderStatusModel.fromJson(e))
          .toList();
      return Right(list);
    });
  }

}