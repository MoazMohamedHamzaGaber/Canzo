import 'package:canzo_app/feature/profile/data/DataSource/profile_remote_data_source.dart';
import 'package:canzo_app/feature/profile/domain/UseCase/get_profile_use_case.dart';
import 'package:canzo_app/feature/profile/domain/UseCase/update_profile_use_case.dart';
import 'package:canzo_app/feature/profile/domain/repository/profile_repository.dart';
import 'package:get_it/get_it.dart';

import '../feature/profile/data/repository/profile_repository_impl.dart';
import '../feature/profile/domain/UseCase/get_admin_profile_use_case.dart';
import '../feature/profile/presentation/cubit/profile_cubit.dart';

class ProfileServiceLocator {
  static void execute(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<ProfileRemoteDataSource>(
          () => ProfileRemoteDataSourceImpl(
        serviceLocator(),
      ),
    );

    serviceLocator.registerLazySingleton<ProfileRepository>(
          () => ProfileRepositoryImpl(
        serviceLocator(),
      ),
    );

    // use cases
    serviceLocator.registerLazySingleton<GetProfileUseCase>(
          () => GetProfileUseCase(
        serviceLocator(),
      ),
    );
    serviceLocator.registerLazySingleton<UpdateProfileUseCase>(
          () => UpdateProfileUseCase(
        serviceLocator(),
      ),
    );
    serviceLocator.registerLazySingleton<GetAdminProfileUseCase>(
          () => GetAdminProfileUseCase(
        serviceLocator(),
      ),
    );

    // cubits
    serviceLocator.registerFactory<ProfileCubit>(
          () => ProfileCubit(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      )
    );
  }
}
