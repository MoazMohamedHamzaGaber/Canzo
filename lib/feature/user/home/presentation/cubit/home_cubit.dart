import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/api/print_helper.dart';
import 'package:canzo_app/core/widget/snake_bar.dart';
import 'package:canzo_app/feature/user/home/domain/usecases/add_baskets_use_case.dart';
import 'package:canzo_app/feature/user/home/domain/usecases/get_baskets_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AddBasketsUseCase _addBasketsUseCase;
  final GetBasketsUseCase _getBasketsUseCase;

  HomeCubit(
      this._addBasketsUseCase,
      this._getBasketsUseCase,
      ) : super(const HomeState());

  void changeCurrentIndex(index)
  {
    emit(
      state.copyWith(currentIndex: index),
    );
  }

  void changeSelectedMaterial(value) {
    emit(
      state.copyWith(selectedMaterialType: value),
    );
  }
  void changeSelectedActive(value) {
    emit(
      state.copyWith(selectedActiveType: value),
    );
  }

  void increment(String key) {
    final newCounters = Map<String, int>.from(state.counters);
    newCounters[key] = newCounters[key]! + 1;

    emit(state.copyWith(counters: newCounters));
  }

  void decrement(String key) {
    final newCounters = Map<String, int>.from(state.counters);

    if (newCounters[key]! > 0) {
      newCounters[key] = newCounters[key]! - 1;
    }

    emit(state.copyWith(counters: newCounters));
  }


  Future<void> addBaskets(BuildContext context, AddBasketsParams params) async {
    emit(state.copyWith(status: HomeStates.loading));

    final response = await _addBasketsUseCase(params);
    response.fold(
          (l) {
        emit(state.copyWith(failure: l, status: HomeStates.error));
        showSnackBar(
          context: context,
          message: l.errMessage,
          backgroundColor: Colors.red,
        );
      },
          (data) {
        emit(state.copyWith(status: HomeStates.addSuccess));
        pr(data);
      },
    );
  }

  Future<void> getBaskets(BuildContext context) async {
    emit(state.copyWith(status: HomeStates.loading));

    final response = await _getBasketsUseCase(NoParams());
    response.fold(
          (l) {
        emit(state.copyWith(failure: l, status: HomeStates.error));
        showSnackBar(
          context: context,
          message: l.errMessage,
          backgroundColor: Colors.red,
        );
      },
          (data) {
        emit(state.copyWith(baskets: data,status: HomeStates.addSuccess));
        pr(data);
      },
    );
  }

  void resetState() {
    emit(
      state.copyWith(
        status: HomeStates.initial,
      ),
    );
  }
}
