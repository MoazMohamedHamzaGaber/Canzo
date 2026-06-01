import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/abstract/use_case.dart';
import '../../domain/useCase/get_order_use_case.dart';
import '../../domain/useCase/update_order_use_case.dart';
import 'overview_state.dart';

class OverviewCubit extends Cubit<OverviewState> {
  final GetOrdersUseCase getOrdersUseCase;
  final UpdateOrderUseCase updateOrderUseCase;

  OverviewCubit(this.getOrdersUseCase, this.updateOrderUseCase)
    : super(const OverviewState());

  Future<void> getOrders() async {
    emit(state.copyWith(status: OverviewStates.loading));

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
}
