import 'package:canzo_app/core/api/print_helper.dart';
import 'package:canzo_app/core/widget/snake_bar.dart';
import 'package:canzo_app/feature/authentication/domain/cases/forget_password_use_case.dart';
import 'package:canzo_app/feature/authentication/domain/cases/params.dart';
import 'package:canzo_app/feature/authentication/domain/cases/reset_password_use_case.dart';
import 'package:canzo_app/feature/authentication/domain/cases/set_up_profile_use_case.dart';
import 'package:canzo_app/feature/authentication/domain/cases/sign_in_use_case.dart';
import 'package:canzo_app/feature/authentication/domain/cases/sign_up_use_case.dart';
import 'package:canzo_app/feature/authentication/domain/cases/verify_otp_use_case.dart';
import 'package:canzo_app/feature/authentication/domain/entity/activity_type.dart';
import 'package:canzo_app/feature/authentication/domain/entity/app_role.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/service/social_auth_service.dart';
import '../../../../core/shared/shared_preference.dart';
import '../../../../core/utils/const.dart';
import '../../domain/cases/google_login_use_case.dart';
import '../view/login_view.dart';
import '../view/widget/complete_profile_view.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCases _signUpUseCases;
  final SignInUseCases _signInUseCases;
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
  final GoogleLoginUseCase _googleLoginUseCase;
  final SetupProfileUseCase _profileUseCase;

  AuthCubit(
    this._signUpUseCases,
    this._signInUseCases,
    this._resetPasswordUseCase,
    this._verifyOtpUseCase,
    this._forgetPasswordUseCase,
    this._googleLoginUseCase,
    this._profileUseCase,
  ) : super(const AuthState());

  void changeSelectedActivity(ActivityType value) {
    emit(state.copyWith(selectedActivityType: value));
  }

  ActivityType? getActivityTypeFromString(String value) {
    final normalized = value.trim().toLowerCase();

    if (normalized == ActivityType.restaurant.apiValue.toLowerCase()) {
      return ActivityType.restaurant;
    }

    if (normalized == ActivityType.cafe.apiValue.toLowerCase()) {
      return ActivityType.cafe;
    }

    if (normalized == ActivityType.weddingHall.apiValue.toLowerCase()) {
      return ActivityType.weddingHall;
    }

    if (normalized == ActivityType.club.apiValue.toLowerCase()) {
      return ActivityType.club;
    }

    return null;
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
        emit(state.copyWith(status: AuthStates.successSignUp));
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
      (data) async {
        AppRole role;

        switch (data.userRole) {
          case 'Admin':
            role = AppRole.admin;
            break;

          case 'delivery':
            role = AppRole.delivery;
            break;

          default:
            role = AppRole.user;
        }

        emit(
          state.copyWith(
            user: data,
            appRole: role,
            status: AuthStates.successSignIn,
          ),
        );
        pr(data.message);
      },
    );
  }

  Future<void> forgetPassword(
    BuildContext context,
    ForgetPasswordParams params,
  ) async {
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

  Future<void> resetPassword(
    BuildContext context,
    ResetPasswordParams params,
  ) async {
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
        emit(state.copyWith(verify: data, status: AuthStates.successVerifyOtp));
        pr(data.message);
      },
    );
  }

  void resetState() {
    emit(state.copyWith(status: AuthStates.initial));
  }

  void resetAuth() {
    emit(AuthState.initial());
  }

  Future<void> logout(BuildContext context) async {
   // await GoogleSignIn.instance.signOut();

    await SharedPreference.removeData(key: 'token');
    await SharedPreference.removeData(key: 'role');

    token = null;
    role = null;

    emit(AuthState.initial());

    if (context.mounted) {
      navigateAndFinish(context, const LoginView());
    }
  }

  Future<void> socialLogin(
    BuildContext context, {
    required String token,
    required String provider,
  }) async {
    try {
      emit(state.copyWith(status: AuthStates.loading));

      /// هنا هتبعت للباك اند
      ///
      /// provider => google / facebook
      /// token => social token

      print(token);
      print(provider);
    } catch (e) {
      emit(state.copyWith(status: AuthStates.error));

      showSnackBar(
        context: context,
        message: e.toString(),
        backgroundColor: Colors.red,
      );
    }
  }

  Future<void> googleLogin(BuildContext context) async {
    print('1-googleLogin started');

    emit(state.copyWith(status: AuthStates.loading));

    try {
      final idToken = await SocialAuthService.signInWithGoogle();

      print('2-idToken: $idToken');

      if (idToken == null) {
        print('3-idToken is null');
        emit(state.copyWith(status: AuthStates.initial));
        return;
      }

      final response = await _googleLoginUseCase(
        GoogleLoginParams(idToken: idToken),
      );

      print('4-api finished');

      response.fold(
            (failure) {
          emit(state.copyWith(
            status: AuthStates.error,
            failure: failure,
          ));
        },
            (user) async {
          await SharedPreference.saveData(
            key: 'token',
            value: user.token,
          );

          await SharedPreference.saveData(
            key: 'role',
            value: user.userRole,
          );

          token = user.token;
          role = user.userRole;

          print('TOKEN SAVED => $token');

          if (user.isFirstLogin == true) {

            emit(
              state.copyWith(
                status: AuthStates.initial,
                user: null,
              ),
            );

            navigateTo(
              context,
              const CompleteProfileView(),
            );
          }
          else{
            navigateAndFinish(context, BottomNavBar());
          }
        },
      );
    } catch (e, s) {
      print('ERROR => $e');
      print(s);

      emit(state.copyWith(status: AuthStates.error));
    }
  }
  Future<void> setupProfile(
      BuildContext context,
      SetupProfileParams params,
      ) async {
    emit(state.copyWith(status: AuthStates.loadingProfile));

    final response = await _profileUseCase(params);

    response.fold(
          (failure) {
        emit(
          state.copyWith(
            failure: failure,
            status: AuthStates.error,
          ),
        );
        showSnackBar(context: context, message: failure.errMessage);
        print('SETUP PROFILE ERROR => ${failure.errMessage}');
      },
          (_) {
        emit(
          state.copyWith(
            status: AuthStates.successProfile,
          ),
        );
        print('SETUP PROFILE SUCCESS');
      },
    );
  }
}
