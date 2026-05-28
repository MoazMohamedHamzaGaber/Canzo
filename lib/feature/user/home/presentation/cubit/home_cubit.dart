import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/api/print_helper.dart';
import 'package:canzo_app/core/widget/snake_bar.dart';
import 'package:canzo_app/feature/user/home/domain/usecases/add_baskets_use_case.dart';
import 'package:canzo_app/feature/user/home/domain/usecases/fill_baskets_use_case.dart';
import 'package:canzo_app/feature/user/home/domain/usecases/get_baskets_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AddBasketsUseCase _addBasketsUseCase;
  final GetBasketsUseCase _getBasketsUseCase;
  final FillBasketsUseCase _fillBasketsUseCase;

  HomeCubit(
      this._addBasketsUseCase,
      this._getBasketsUseCase,
      this._fillBasketsUseCase,
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

    newCounters[key] = (newCounters[key] ?? 1) + 1;

    emit(state.copyWith(counters: newCounters));
  }

  void decrement(String key) {
    final newCounters = Map<String, int>.from(state.counters);

    final currentValue = newCounters[key] ?? 1;

    if (currentValue > 1) {
      newCounters[key] = currentValue - 1;
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

  Future<void> fillBaskets(
      BuildContext context,
      int id,
      ) async {
    //emit(state.copyWith(status: HomeStates.loading));

    final response = await _fillBasketsUseCase(id);

    response.fold(
          (l) {
        emit(
          state.copyWith(
            failure: l,
            status: HomeStates.error,
          ),
        );

        if (context.mounted) {
          showSnackBar(
            context: context,
            message: l.errMessage,
            backgroundColor: Colors.red,
          );
        }
      },
          (data) {
        final updatedBaskets = state.baskets?.map((basket) {
          if (basket.id == id) {
            return basket.copyWith(
              isFull: 1,
            );
          }

          return basket;
        }).toList();

        emit(
          state.copyWith(
            baskets: updatedBaskets,
            status: HomeStates.fillSuccess,
          ),
        );
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
