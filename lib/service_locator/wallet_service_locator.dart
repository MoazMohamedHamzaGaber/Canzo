import 'package:canzo_app/feature/user/wallet/data/DataSource/wallet_remote_data_source.dart';
import 'package:canzo_app/feature/user/wallet/data/repository/wallet_repository_impl.dart';
import 'package:canzo_app/feature/user/wallet/domain/UseCase/get_transaction_use_case.dart';
import 'package:canzo_app/feature/user/wallet/domain/UseCase/get_wallet_use_case.dart';
import 'package:canzo_app/feature/user/wallet/domain/repository/wallet_repository.dart';
import 'package:canzo_app/feature/user/wallet/presentation/cubit/wallet_cubit.dart';
import 'package:get_it/get_it.dart';

import '../feature/user/wallet/domain/UseCase/get_withdraw_use_case.dart';


class WalletServiceLocator {
  static void execute(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<WalletRemoteDataSource>(
          () => WalletRemoteDataSourceImpl(
        serviceLocator(),
      ),
    );

    serviceLocator.registerLazySingleton<WalletRepository>(
          () => WalletRepositoryImpl(
        serviceLocator(),
      ),
    );

    // use cases
    serviceLocator.registerLazySingleton<GetTransactionUseCase>(
          () => GetTransactionUseCase(
        serviceLocator(),
      ),
    );
    serviceLocator.registerLazySingleton<GetWalletUseCase>(
          () => GetWalletUseCase(
        serviceLocator(),
      ),
    );
    serviceLocator.registerLazySingleton<GetWithdrawUseCase>(
          () => GetWithdrawUseCase(
        serviceLocator(),
      ),
    );

    // cubits
    serviceLocator.registerFactory<WalletCubit>(
          () => WalletCubit(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      )
    );
  }
}
