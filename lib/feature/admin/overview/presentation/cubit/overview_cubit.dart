import 'package:canzo_app/feature/admin/overview/domain/useCase/get_wallet_admin_use_case.dart';
import 'package:canzo_app/feature/admin/overview/domain/useCase/get_withdraw_admin_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/abstract/use_case.dart';
import '../../domain/useCase/get_order_use_case.dart';
import '../../domain/useCase/update_order_use_case.dart';
import 'overview_state.dart';

class OverviewCubit extends Cubit<OverviewState> {
  final GetOrdersUseCase getOrdersUseCase;
  final UpdateOrderUseCase updateOrderUseCase;
  final GetWalletAdminUseCase getWalletAdminUseCase;
  final GetWithdrawAdminUseCase getWithdrawAdminUseCase;

  OverviewCubit(
    this.getOrdersUseCase,
    this.updateOrderUseCase,
    this.getWalletAdminUseCase,
    this.getWithdrawAdminUseCase,
  ) : super(const OverviewState());

  Future<void> loadData() async {
    emit(state.copyWith(status: OverviewStates.loading));

    await getOrders();
    await getWallet();
    await getWithdraw();
  }

  Future<void> getOrders() async {
    final result = await getOrdersUseCase(NoParams());

    result.fold(
      (failure) {
        emit(state.copyWith(status: OverviewStates.error, failure: failure));
      },
      (orders) {
        emit(state.copyWith(status: OverviewStates.success, orders: orders));
      },
    );
  }

  Future<void> updateOrder(UpdateOrderParams params) async {
    emit(state.copyWith(status: OverviewStates.updateLoading));

    final result = await updateOrderUseCase(params);

    result.fold(
      (failure) {
        emit(state.copyWith(status: OverviewStates.error, failure: failure));
      },
      (message) async {
        emit(
          state.copyWith(
            status: OverviewStates.updateSuccess,
            message: message,
          ),
        );

        await getOrders();
      },
    );
  }

  Future<void> getWallet() async {
    final result = await getWalletAdminUseCase(NoParams());

    result.fold(
      (failure) {
        emit(state.copyWith(status: OverviewStates.error, failure: failure));
      },
      (wallet) {
        emit(state.copyWith(status: OverviewStates.success, wallet: wallet));
      },
    );
  }

  Future<void> getWithdraw() async {
    final result = await getWithdrawAdminUseCase(NoParams());

    result.fold(
          (failure) {
        emit(state.copyWith(status: OverviewStates.error, failure: failure));
      },
          (withdraw) {
        emit(state.copyWith(status: OverviewStates.success, withdraw: withdraw));
      },
    );
  }
}
