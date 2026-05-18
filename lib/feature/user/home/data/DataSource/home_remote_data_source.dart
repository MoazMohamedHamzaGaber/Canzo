import 'package:canzo_app/core/api/api_consumer.dart';
import 'package:canzo_app/core/api/end_points.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/user/home/data/model/basket_model.dart';
import 'package:canzo_app/feature/user/home/domain/entity/basket_entity.dart';
import 'package:canzo_app/feature/user/home/domain/usecases/add_baskets_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure,bool>> addBaskets(AddBasketsParams params);
  Future<Either<Failure,List<BasketEntity>>> getBaskets();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer _apiConsumer;

  HomeRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<Either<Failure, bool>> addBaskets(AddBasketsParams params
      ) async {
    var result = await _apiConsumer.post(
      EndPoints.baskets,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
      formData: FormData.fromMap({
        'data': [
          params.toJson(),
        ],
      }),
    );

    return result.fold((failure) => Left(failure), (response) {
      return Right(true);
    });
  }

  @override
  Future<Either<Failure, List<BasketEntity>>> getBaskets() async {
    var result = await _apiConsumer.get(
      EndPoints.baskets,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return result.fold((failure) => Left(failure), (response) {
      final list = (response as List)
          .map((e) => BasketModel.fromJson(e))
          .toList();
      return Right(list);
    });
  }
}
