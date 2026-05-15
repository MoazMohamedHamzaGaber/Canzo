import 'package:canzo_app/feature/authentication/data/DataSource/login_remote_data_source.dart';
import 'package:canzo_app/feature/authentication/data/repository/login_repository_impl.dart';
import 'package:canzo_app/feature/authentication/domain/repository/auth_repository.dart';
import 'package:canzo_app/feature/authentication/domain/useCases/sign_up_use_case.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

class AuthServiceLocator {
  static void execute(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImpl(
        serviceLocator(),
      ),
    );

    serviceLocator.registerLazySingleton<AuthRepository>(
          () => AuthRepositoryImpl(
        serviceLocator(),
      ),
    );

    // use cases
    serviceLocator.registerLazySingleton<SignUpUseCases>(
          () => SignUpUseCases(
        serviceLocator(),
      ),
    );

    // cubits
    serviceLocator.registerFactory<AuthCubit>(
          () => AuthCubit(
        serviceLocator(),
      )
    );
  }
}
