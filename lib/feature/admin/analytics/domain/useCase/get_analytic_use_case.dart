import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/admin/analytics/domain/entity/analytic_entity.dart';
import 'package:canzo_app/feature/admin/analytics/domain/repository/analytic_repository.dart';
import 'package:dartz/dartz.dart';

class GetAnalyticUseCase extends UseCase<AnalyticsEntity, NoParams> {
  final AnalyticsRepository _repository;

  GetAnalyticUseCase(this._repository);

  @override
  Future<Either<Failure, AnalyticsEntity>> call(NoParams params) async {
    return await _repository.getAnalytics();
  }
}