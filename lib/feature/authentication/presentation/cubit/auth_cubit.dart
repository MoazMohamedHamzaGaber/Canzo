import 'package:canzo_app/core/api/print_helper.dart';
import 'package:canzo_app/core/widget/snake_bar.dart';
import 'package:canzo_app/feature/authentication/domain/cases/forget_password_use_case.dart';
import 'package:canzo_app/feature/authentication/domain/cases/params.dart';
import 'package:canzo_app/feature/authentication/domain/cases/reset_password_use_case.dart';
import 'package:canzo_app/feature/authentication/domain/cases/sign_in_use_case.dart';
import 'package:canzo_app/feature/authentication/domain/cases/sign_up_use_case.dart';
import 'package:canzo_app/feature/authentication/domain/cases/verify_otp_use_case.dart';
import 'package:canzo_app/feature/authentication/domain/entity/activity_type.dart';
import 'package:canzo_app/feature/authentication/domain/entity/app_role.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCases _signUpUseCases;
  final SignInUseCases _signInUseCases;
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;

  AuthCubit(
    this._signUpUseCases,
    this._signInUseCases,
    this._resetPasswordUseCase,
    this._verifyOtpUseCase,
    this._forgetPasswordUseCase,
  ) : super(const AuthState());

  void changeSelectedActivity(ActivityType value) {
    emit(state.copyWith(selectedActivityType: value));
  }

  void selectRole(AppRole role) {
    emit(state.copyWith(appRole: role));
  }

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  void changePasswordObscure() {
    obscurePassword = !obscurePassword;

    emit(
      state.copyWith(
        obscurePassword: obscurePassword,
        obscureConfirmPassword: obscureConfirmPassword,
      ),
    );
  }

  void changeConfirmPasswordObscure() {
    obscureConfirmPassword = !obscureConfirmPassword;

    emit(
      state.copyWith(
        obscurePassword: obscurePassword,
        obscureConfirmPassword: obscureConfirmPassword,
      ),
    );
  }

  Future<void> signUp(BuildContext context, SignUpParams params) async {
    emit(state.copyWith(status: AuthStates.loading));

    final response = await _signUpUseCases(params);
    response.fold(
      (l) {
        emit(state.copyWith(failure: l, status: AuthStates.error));
        showSnackBar(
          context: context,
          message: l.errMessage,
          backgroundColor: Colors.red,
        );
      },
      (data) {
        emit(state.copyWith(status: AuthStates.success));
        pr(data);
      },
    );
  }

  Future<void> signIn(BuildContext context, SignInParams params) async {
    emit(state.copyWith(status: AuthStates.loading));

    final response = await _signInUseCases(params);
    response.fold(
      (l) {
        emit(state.copyWith(failure: l, status: AuthStates.error));
        showSnackBar(
          context: context,
          message: l.errMessage,
          backgroundColor: Colors.red,
        );
      },
      (data) {
        emit(state.copyWith(user: data, status: AuthStates.success));
        pr(data.message);
      },
    );
  }

  Future<void> forgetPassword(BuildContext context, ForgetPasswordParams params) async {
    emit(state.copyWith(status: AuthStates.loading));

    final response = await _forgetPasswordUseCase(params);
    response.fold(
      (l) {
        emit(state.copyWith(failure: l, status: AuthStates.error));
        showSnackBar(
          context: context,
          message: l.errMessage,
          backgroundColor: Colors.red,
        );
      },
      (data) {
        emit(state.copyWith(status: AuthStates.success));
        pr(data);
      },
    );
  }

  Future<void> resetPassword(BuildContext context, ResetPasswordParams params) async {
    emit(state.copyWith(status: AuthStates.loading));

    final response = await _resetPasswordUseCase(params);
    response.fold(
      (l) {
        emit(state.copyWith(failure: l, status: AuthStates.error));
        showSnackBar(
          context: context,
          message: l.errMessage,
          backgroundColor: Colors.red,
        );
      },
      (data) {
        emit(state.copyWith(status: AuthStates.successForgetPassword));
        pr(data);
      },
    );
  }

  Future<void> verifyOtp(BuildContext context, VerifyOtpParams params) async {
    emit(state.copyWith(status: AuthStates.loading));

    final response = await _verifyOtpUseCase(params);
    response.fold(
      (l) {
        emit(state.copyWith(failure: l, status: AuthStates.error));
        showSnackBar(
          context: context,
          message: l.errMessage,
          backgroundColor: Colors.red,
        );
      },
      (data) {
        emit(state.copyWith(status: AuthStates.successVerifyOtp));
        pr(data);
      },
    );
  }

  void resetState() {
    emit(
      state.copyWith(
        status: AuthStates.initial,
      ),
    );
  }
}
