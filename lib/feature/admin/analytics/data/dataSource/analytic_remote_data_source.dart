import 'package:canzo_app/feature/admin/analytics/data/model/analytic_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/const.dart';
import '../../domain/entity/analytic_entity.dart';

abstract class AnalyticsRemoteDataSource {
  Future<Either<Failure,AnalyticsEntity>> getAnalytics();
}

class AnalyticsRemoteDataSourceImpl
    implements AnalyticsRemoteDataSource {
  final ApiConsumer _apiConsumer;

  AnalyticsRemoteDataSourceImpl(this._apiConsumer);


  @override
  Future<Either<Failure, AnalyticsEntity>> getAnalytics() async {
    var result = await _apiConsumer.get(
      EndPoints.analytics,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return result.fold((failure) => Left(failure), (response) {
      return Right(AnalyticsModel.fromJson(response));
    });
  }
}