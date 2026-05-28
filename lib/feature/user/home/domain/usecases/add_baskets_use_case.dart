import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/user/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class AddBasketsUseCase extends UseCase<bool, AddBasketsParams> {
  final HomeRepository _homeRepository;

  AddBasketsUseCase(this._homeRepository);

  @override
  Future<Either<Failure, bool>> call(AddBasketsParams params) async {
    return await _homeRepository.addBaskets(params);
  }
}

class AddBasketsParams{
  final String contentType;
  final int contentWeight;
  final int amount;

  AddBasketsParams({required this.contentType, required this.contentWeight, required this.amount});

  Map<String,dynamic> toJson() => {
    'content_type': contentType,
    'content_weight': contentWeight,
    'amount': amount,
  };
}