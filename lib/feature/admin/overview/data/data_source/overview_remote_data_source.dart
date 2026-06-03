import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/const.dart';
import '../../domain/entity/order_entity.dart';
import '../../domain/useCase/update_order_use_case.dart';
import '../model/order_model.dart';

abstract class OverviewRemoteDataSource {
  Future<Either<Failure, List<OrderEntity>>> getOrders();

  Future<Either<Failure, String>> updateOrder(UpdateOrderParams params);
}

class OverviewRemoteDataSourceImpl implements OverviewRemoteDataSource {
  final ApiConsumer apiConsumer;

  OverviewRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() async {
    final result = await apiConsumer.get(
      EndPoints.orders,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return result.fold(
          (failure) => Left(failure),
          (response) {
        final orders = (response['orders'] as List)
            .map((e) => OrderModel.fromJson(e))
            .toList();

        return Right(orders);
      },
    );
  }

  @override
  Future<Either<Failure, String>> updateOrder(UpdateOrderParams params) async {
    FormData formData = FormData.fromMap({
      'status': params.status,
      if (params.image != null)
        'image': await MultipartFile.fromFile(params.image!.path),
    });

    final result = await apiConsumer.patch(
      "${EndPoints.order}/${params.orderId}",
      formData: formData,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response['message']),
    );
  }
}
