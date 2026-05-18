import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/user/home/domain/entity/basket_entity.dart';
import 'package:canzo_app/feature/user/home/domain/usecases/add_baskets_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure,bool>> addBaskets(AddBasketsParams params);
  Future<Either<Failure,List<BasketEntity>>> getBaskets();
}