import 'package:canzo_app/feature/admin/analytics/data/repository/analytic_repository_impl.dart';
import 'package:canzo_app/feature/admin/analytics/domain/useCase/get_analytic_use_case.dart';
import 'package:get_it/get_it.dart';

import '../feature/admin/analytics/data/dataSource/analytic_remote_data_source.dart';
import '../feature/admin/analytics/domain/repository/analytic_repository.dart';
import '../feature/admin/analytics/presentation/cubit/analytics_cubit.dart';

class AnalyticsServiceLocator {
  static void execute(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<AnalyticsRemoteDataSource>(
          () => AnalyticsRemoteDataSourceImpl(
        serviceLocator(),
      ),
    );

    serviceLocator.registerLazySingleton<AnalyticsRepository>(
          () => AnalyticRepositoryImpl(
        serviceLocator(),
      ),
    );

    // use cases
    serviceLocator.registerLazySingleton<GetAnalyticUseCase>(
          () => GetAnalyticUseCase(
        serviceLocator(),
      ),
    );

    // cubits
    serviceLocator.registerFactory<AnalyticsCubit>(
          () => AnalyticsCubit(
        serviceLocator(),
      )
    );
  }
}
