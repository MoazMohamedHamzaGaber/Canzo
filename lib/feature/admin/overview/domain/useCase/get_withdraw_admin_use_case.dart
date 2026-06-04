import 'package:canzo_app/feature/admin/overview/domain/entity/withdraw_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/abstract/use_case.dart';
import '../../../../../core/error/failure.dart';
import '../repository/overview_repository.dart';

class GetWithdrawAdminUseCase extends UseCase<List<WithdrawalEntity>, NoParams> {
  final OverviewRepository repository;

  GetWithdrawAdminUseCase(this.repository);

  @override
  Future<Either<Failure, List<WithdrawalEntity>>> call(NoParams params) {
    return repository.getWithdraw();
  }
}
