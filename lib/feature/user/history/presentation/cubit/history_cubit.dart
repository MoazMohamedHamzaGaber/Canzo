import 'package:canzo_app/core/api/print_helper.dart';
import 'package:canzo_app/core/widget/snake_bar.dart';
import 'package:canzo_app/feature/user/history/domain/UseCase/order_status_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final OrderStatusUseCase _orderStatusUseCase;

  HistoryCubit(
      this._orderStatusUseCase,
      ) : super(const HistoryState());


  Future<void> getBaskets(BuildContext context, String status) async {
    emit(state.copyWith(status: HistoryStates.loading));

    final response = await _orderStatusUseCase(status);
    response.fold(
          (l) {
        emit(state.copyWith(failure: l, status: HistoryStates.error));
        showSnackBar(
          context: context,
          message: l.errMessage,
          backgroundColor: Colors.red,
        );
      },
          (data) {
        emit(state.copyWith(orders: data,status: HistoryStates.success));
        pr(data);
      },
    );
  }
}
