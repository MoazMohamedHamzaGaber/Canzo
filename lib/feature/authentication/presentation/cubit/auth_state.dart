import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/authentication/domain/entity/activity_type.dart';
import 'package:canzo_app/feature/authentication/domain/entity/app_role.dart';
import 'package:canzo_app/feature/authentication/domain/entity/login_entity.dart';
import 'package:canzo_app/feature/authentication/domain/entity/verify_entity.dart';

enum AuthStates { loading,loadingProfile, initial, error, success , successSignIn, successSignUp,successProfile, successVerifyOtp,successForgetPassword}

class AuthState {
  final AuthStates status;
  final Failure? failure;
  final ActivityType? selectedActivityType;
  final AppRole? appRole;
  final bool? obscurePassword;
  final bool? obscureConfirmPassword;
  final LoginEntity? user;
  final VerifyEntity? verify;

  const AuthState({
    this.status = AuthStates.initial,
    this.failure,
    this.selectedActivityType,
    this.appRole,
    this.obscurePassword,
    this.obscureConfirmPassword,
    this.user,
    this.verify,
  });
  AuthState copyWith({
    AuthStates? status,
    Failure? failure,
    ActivityType? selectedActivityType,
    AppRole? appRole,
    bool? obscureText,
    bool? obscurePassword,
    bool? obscureConfirmPassword,
    LoginEntity? user,
    VerifyEntity? verify,
  }) {
    return AuthState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      selectedActivityType: selectedActivityType ?? this.selectedActivityType,
      appRole: appRole ?? this.appRole,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      obscureConfirmPassword: obscureConfirmPassword ?? this.obscureConfirmPassword,
      user: user ?? this.user,
      verify: verify ?? this.verify,
    );
  }
  factory AuthState.initial() {
    return AuthState(
      status: AuthStates.initial,
      user: null,
      selectedActivityType: null,
      obscurePassword: true,
      obscureConfirmPassword: true,
    );
  }
}
