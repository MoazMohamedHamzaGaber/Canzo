import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/user/home/domain/entity/basket_entity.dart';
import 'package:canzo_app/feature/user/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetBasketsUseCase extends UseCase<List<BasketEntity>, NoParams> {
  final HomeRepository _homeRepository;

  GetBasketsUseCase(this._homeRepository);

  @override
  Future<Either<Failure, List<BasketEntity>>> call(NoParams params) async {
    return await _homeRepository.getBaskets();
  }
}