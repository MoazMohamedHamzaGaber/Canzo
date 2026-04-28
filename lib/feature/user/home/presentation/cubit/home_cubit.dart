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
}
