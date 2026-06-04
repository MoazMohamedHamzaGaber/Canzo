import 'package:canzo_app/feature/admin/overview/data/data_source/overview_remote_data_source.dart';
import 'package:canzo_app/feature/admin/overview/data/repository/overview_repository_impl.dart';
import 'package:canzo_app/feature/admin/overview/domain/repository/overview_repository.dart';
import 'package:canzo_app/feature/admin/overview/domain/useCase/get_order_use_case.dart';
import 'package:canzo_app/feature/admin/overview/domain/useCase/update_order_use_case.dart';
import 'package:canzo_app/feature/admin/overview/presentation/cubit/overview_cubit.dart';
import 'package:get_it/get_it.dart';

import '../feature/admin/overview/domain/useCase/get_wallet_admin_use_case.dart';
import '../feature/admin/overview/domain/useCase/get_withdraw_admin_use_case.dart';

class OverViewServiceLocator {
  static void execute(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<OverviewRemoteDataSource>(
          () => OverviewRemoteDataSourceImpl(
        serviceLocator(),
      ),
    );

    serviceLocator.registerLazySingleton<OverviewRepository>(
          () => OverviewRepositoryImpl(
        serviceLocator(),
      ),
    );

    // use cases
    serviceLocator.registerLazySingleton<GetOrdersUseCase>(
          () => GetOrdersUseCase(
        serviceLocator(),
      ),
    );
    serviceLocator.registerFactory<UpdateOrderUseCase>(
            () => UpdateOrderUseCase(
          serviceLocator(),
        )
    );
    serviceLocator.registerFactory<GetWalletAdminUseCase>(
            () => GetWalletAdminUseCase(
          serviceLocator(),
        )
    );
    serviceLocator.registerFactory<GetWithdrawAdminUseCase>(
            () => GetWithdrawAdminUseCase(
          serviceLocator(),
        )
    );

    // cubits
    serviceLocator.registerFactory<OverviewCubit>(
          () => OverviewCubit(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      )
    );
  }
}
