import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

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
}
