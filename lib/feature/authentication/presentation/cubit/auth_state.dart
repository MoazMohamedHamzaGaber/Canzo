import 'package:canzo_app/feature/authentication/domain/entity/activity_type.dart';
import 'package:canzo_app/feature/authentication/domain/entity/app_role.dart';

enum AuthStates { loading, initial, error }

class AuthState {
  final AuthStates status;
  //final Failure? failure;
  final ActivityType? selectedActivityType;
  final AppRole? appRole;
  final bool? obscurePassword;
  final bool? obscureConfirmPassword;

  const AuthState({
    this.status = AuthStates.initial,
    //this.failure,
    this.selectedActivityType,
    this.appRole,
    this.obscurePassword,
    this.obscureConfirmPassword,
  });
  AuthState copyWith({
    AuthStates? status,
    //Failure? failure,
    ActivityType? selectedActivityType,
    AppRole? appRole,
    bool? obscureText,
    bool? obscurePassword,
    bool? obscureConfirmPassword,
  }) {
    return AuthState(
      status: status ?? this.status,
      //failure: failure ?? this.failure,
      selectedActivityType: selectedActivityType ?? this.selectedActivityType,
      appRole: appRole ?? this.appRole,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      obscureConfirmPassword: obscureConfirmPassword ?? this.obscureConfirmPassword,
    );
  }
}
