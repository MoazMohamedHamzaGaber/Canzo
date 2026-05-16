import 'package:canzo_app/feature/authentication/data/DataSource/auth_remote_data_source.dart';
import 'package:canzo_app/feature/authentication/data/repository/auth_repository_impl.dart';
import 'package:canzo_app/feature/authentication/domain/cases/sign_in_use_case.dart';
import 'package:canzo_app/feature/authentication/domain/cases/sign_up_use_case.dart';
import 'package:canzo_app/feature/authentication/domain/repository/auth_repository.dart';
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
    serviceLocator.registerLazySingleton<SignInUseCases>(
          () => SignInUseCases(
        serviceLocator(),
      ),
    );

    // cubits
    serviceLocator.registerFactory<AuthCubit>(
          () => AuthCubit(
        serviceLocator(),
        serviceLocator(),
      )
    );
  }
}
