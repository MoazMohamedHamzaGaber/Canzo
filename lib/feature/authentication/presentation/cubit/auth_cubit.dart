import 'package:canzo_app/feature/authentication/domain/entity/activity_type.dart';
import 'package:canzo_app/feature/authentication/domain/entity/app_role.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());


  void changeSelectedActivity(ActivityType value) {
    emit(
      state.copyWith(selectedActivityType: value),
    );
  }
  void selectRole(AppRole role) {
    emit(
      state.copyWith(appRole: role),
    );
  }
}
