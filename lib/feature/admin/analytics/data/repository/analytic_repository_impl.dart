import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/admin/analytics/data/dataSource/analytic_remote_data_source.dart';

import 'package:canzo_app/feature/admin/analytics/domain/entity/analytic_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/analytic_repository.dart';

class AnalyticRepositoryImpl extends AnalyticsRepository{
  final AnalyticsRemoteDataSource _remoteDataSource;

  AnalyticRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, AnalyticsEntity>> getAnalytics() {
    return _remoteDataSource.getAnalytics();
  }
}