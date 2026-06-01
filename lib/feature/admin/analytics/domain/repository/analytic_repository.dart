import 'package:canzo_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entity/analytic_entity.dart';

abstract class AnalyticsRepository {
  Future<Either<Failure,AnalyticsEntity>> getAnalytics();
}
