import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());


  void changeSelectedActivity(value) {
    emit(
      state.copyWith(selectedActivityType: value),
    );
  }
}
