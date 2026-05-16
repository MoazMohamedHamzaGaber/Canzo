import 'package:canzo_app/feature/user/home/presentation/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

class HomeServiceLocator {
  static void execute(GetIt serviceLocator) {
    // serviceLocator.registerLazySingleton<HomeRemoteDataSource>(
    //       () => HomeRemoteDataSourceImpl(
    //     serviceLocator(),
    //   ),
    // );
    //
    // serviceLocator.registerLazySingleton<HomeRepository>(
    //       () => HomeRepositoryImpl(
    //     serviceLocator(),
    //   ),
    // );
    //
    // // use cases
    // serviceLocator.registerLazySingleton<SignUpUseCases>(
    //       () => SignUpUseCases(
    //     serviceLocator(),
    //   ),
    // );
    // serviceLocator.registerLazySingleton<SignInUseCases>(
    //       () => SignInUseCases(
    //     serviceLocator(),
    //   ),
    // );

    // cubits
    serviceLocator.registerFactory<HomeCubit>(
          () => HomeCubit(
        // serviceLocator(),
        // serviceLocator(),
      )
    );
  }
}
