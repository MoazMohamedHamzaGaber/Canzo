import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

class LoginServiceLocator {
  static void execute(GetIt serviceLocator) {
    // serviceLocator.registerLazySingleton<LoginRemoteDataSource>(
    //       () => LoginRemoteDataSourceImpl(
    //     serviceLocator(),
    //   ),
    // );
    //
    // serviceLocator.registerLazySingleton<LoginRepository>(
    //       () => LoginRepositoryImpl(
    //     serviceLocator(),
    //   ),
    // );
    //
    // // use cases
    // serviceLocator.registerLazySingleton<LoginUseCases>(
    //       () => LoginUseCases(
    //     serviceLocator(),
    //   ),
    // );

    // cubits
    serviceLocator.registerFactory<AuthCubit>(
          () => AuthCubit(
       // serviceLocator(),
      )
    );
  }
}
