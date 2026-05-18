import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/user/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class FillBasketsUseCase extends UseCase<bool, int> {
  final HomeRepository _homeRepository;

  FillBasketsUseCase(this._homeRepository);

  @override
  Future<Either<Failure, bool>> call(int id) async {
    return await _homeRepository.fillBaskets(id);
  }
}