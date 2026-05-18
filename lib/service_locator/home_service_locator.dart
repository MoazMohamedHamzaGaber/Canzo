import 'package:canzo_app/feature/user/home/data/DataSource/home_remote_data_source.dart';
import 'package:canzo_app/feature/user/home/data/repository/home_repository_impl.dart';
import 'package:canzo_app/feature/user/home/domain/usecases/add_baskets_use_case.dart';
import 'package:canzo_app/feature/user/home/domain/usecases/get_baskets_use_case.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

import '../feature/user/home/domain/repository/home_repository.dart';

class HomeServiceLocator {
  static void execute(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<HomeRemoteDataSource>(
          () => HomeRemoteDataSourceImpl(
        serviceLocator(),
      ),
    );

    serviceLocator.registerLazySingleton<HomeRepository>(
          () => HomeRepositoryImpl(
        serviceLocator(),
      ),
    );

    // use cases
    serviceLocator.registerLazySingleton<AddBasketsUseCase>(
          () => AddBasketsUseCase(
        serviceLocator(),
      ),
    );
    serviceLocator.registerLazySingleton<GetBasketsUseCase>(
          () => GetBasketsUseCase(
        serviceLocator(),
      ),
    );

    // cubits
    serviceLocator.registerFactory<HomeCubit>(
          () => HomeCubit(
        serviceLocator(),
        serviceLocator(),
      )
    );
  }
}
