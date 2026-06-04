import 'package:canzo_app/feature/admin/overview/domain/useCase/approve_withdraw_use_case.dart';
import 'package:canzo_app/feature/admin/overview/domain/useCase/get_wallet_admin_use_case.dart';
import 'package:canzo_app/feature/admin/overview/domain/useCase/get_withdraw_admin_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/abstract/use_case.dart';
import '../../../../../core/widget/snake_bar.dart';
import '../../domain/useCase/get_order_use_case.dart';
import '../../domain/useCase/update_order_use_case.dart';
import 'overview_state.dart';

class OverviewCubit extends Cubit<OverviewState> {
  final GetOrdersUseCase getOrdersUseCase;
  final UpdateOrderUseCase updateOrderUseCase;
  final GetWalletAdminUseCase getWalletAdminUseCase;
  final GetWithdrawAdminUseCase getWithdrawAdminUseCase;
  final ApproveWithdrawUseCase approveWithdrawUseCase;

  OverviewCubit(
    this.getOrdersUseCase,
    this.updateOrderUseCase,
    this.getWalletAdminUseCase,
    this.getWithdrawAdminUseCase,
    this.approveWithdrawUseCase,
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

  Future<void> updateOrder(BuildContext context,UpdateOrderParams params) async {
    emit(
      state.copyWith(
        loadingOrderId: params.orderId,
        loadingOrderAction: params.status,
      ),
    );

    final result = await updateOrderUseCase(params);


    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: OverviewStates.error,
            failure: failure,
            loadingOrderId: null,
            loadingOrderAction: null,
          ),
        );
        showSnackBar(
          context: context,
          message: failure.errMessage,
          backgroundColor: Colors.red,
        );
      },
      (message) async {
        emit(
          state.copyWith(
            status: OverviewStates.updateSuccess,
            message: message,
            loadingOrderId: null,
            loadingOrderAction: null,
          ),
        );
        showSnackBar(
          context: context,
          message: params.status == 'Completed'
              ? 'Completed successful'
              : 'Cancel successful',
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
        emit(
          state.copyWith(status: OverviewStates.success, withdraw: withdraw),
        );
      },
    );
  }

  Future<void> approveWithdraw(
      BuildContext context,
      ApproveWithdrawParams params,
      ) async {
    emit(
      state.copyWith(
        loadingWithdrawId: params.withdrawId,
        loadingAction: params.status,
      ),
    );

    final result = await approveWithdrawUseCase(params);

    result.fold(
          (failure) {
        emit(
          state.copyWith(
            loadingWithdrawId: null,
            loadingAction: null,
          ),
        );
        showSnackBar(
          context: context,
          message: failure.errMessage,
          backgroundColor: Colors.red,
        );
      },
          (message) async {
            emit(
              state.copyWith(
                loadingWithdrawId: null,
                loadingAction: null,
                status: OverviewStates.success,
              ),
            );


        showSnackBar(
          context: context,
          message: params.status == 'Approved'
              ? 'Approved successful'
              : 'Rejected successful',
        );

        await getWithdraw();
      },
    );
  }
}
