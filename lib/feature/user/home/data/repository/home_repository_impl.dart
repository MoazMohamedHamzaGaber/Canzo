import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/user/home/data/DataSource/home_remote_data_source.dart';
import 'package:canzo_app/feature/user/home/domain/entity/basket_entity.dart';
import 'package:canzo_app/feature/user/home/domain/repository/home_repository.dart';
import 'package:canzo_app/feature/user/home/domain/usecases/add_baskets_use_case.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl extends HomeRepository{
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, bool>> addBaskets(AddBasketsParams params) {
    return _remoteDataSource.addBaskets(params);
  }

  @override
  Future<Either<Failure, List<BasketEntity>>> getBaskets() {
    return _remoteDataSource.getBaskets();
  }
}