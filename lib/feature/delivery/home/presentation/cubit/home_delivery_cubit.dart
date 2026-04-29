import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_delivery_state.dart';

class HomeDeliveryCubit extends Cubit<HomeDeliveryState> {
  HomeDeliveryCubit() : super(const HomeDeliveryState());

  void changeSelectedActive(value) {
    emit(
      state.copyWith(selectedActiveType: value),
    );
  }
}
