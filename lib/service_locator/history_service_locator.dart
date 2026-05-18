import 'package:canzo_app/feature/user/history/data/DataSource/history_remote_data_source.dart';
import 'package:canzo_app/feature/user/history/data/repository/history_repository_impl.dart';
import 'package:canzo_app/feature/user/history/domain/UseCase/order_status_use_case.dart';
import 'package:canzo_app/feature/user/history/domain/repository/history_repository.dart';
import 'package:canzo_app/feature/user/history/presentation/cubit/history_cubit.dart';
import 'package:get_it/get_it.dart';

class HistoryServiceLocator {
  static void execute(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<HistoryRemoteDataSource>(
          () => HistoryRemoteDataSourceImpl(
        serviceLocator(),
      ),
    );

    serviceLocator.registerLazySingleton<HistoryRepository>(
          () => HistoryRepositoryImpl(
        serviceLocator(),
      ),
    );

    // use cases
    serviceLocator.registerLazySingleton<OrderStatusUseCase>(
          () => OrderStatusUseCase(
        serviceLocator(),
      ),
    );

    // cubits
    serviceLocator.registerFactory<HistoryCubit>(
          () => HistoryCubit(
        serviceLocator(),
      )
    );
  }
}
