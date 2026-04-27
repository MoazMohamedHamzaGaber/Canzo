import 'package:canzo_app/feature/profile/presentation/view/profile_view.dart';
import 'package:canzo_app/feature/user/history/presentation/view/history_view.dart';
import 'package:canzo_app/feature/user/home/presentation/view/home_view.dart';
import 'package:canzo_app/feature/user/wallet/presentation/view/wallet_view.dart';
import 'package:flutter/material.dart';
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

  List<Widget>screens=[
    const HomeView(),
    const HistoryView(),
    const WalletView(),
    const ProfileView(),
  ];

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
