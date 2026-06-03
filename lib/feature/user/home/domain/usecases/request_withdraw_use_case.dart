import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/user/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class RequestWithdrawUseCase extends UseCase<bool, RequestWithdrawParams> {
  final HomeRepository _homeRepository;

  RequestWithdrawUseCase(this._homeRepository);

  @override
  Future<Either<Failure, bool>> call(RequestWithdrawParams params) async {
    return await _homeRepository.requestWithdraw(params);
  }
}

class RequestWithdrawParams{
  final int amount;
  final String number;

  RequestWithdrawParams({required this.amount, required this.number,});

  Map<String,dynamic> toJson() => {
    'amount': amount,
    'wallet_number': number,
  };
}