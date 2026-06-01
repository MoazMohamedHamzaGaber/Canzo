import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/widget/snake_bar.dart';
import 'package:canzo_app/feature/profile/domain/UseCase/get_admin_profile_use_case.dart';
import 'package:canzo_app/feature/profile/domain/UseCase/get_profile_use_case.dart';
import 'package:canzo_app/feature/profile/domain/UseCase/update_profile_use_case.dart';
import 'package:canzo_app/feature/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final GetAdminProfileUseCase _adminProfileUseCase;

  ProfileCubit(this._getProfileUseCase, this._updateProfileUseCase,this._adminProfileUseCase)
    : super(const ProfileState());

  Future<void> getProfile() async {
    emit(state.copyWith(status: ProfileStates.loading));

    final response = await _getProfileUseCase(NoParams());
    response.fold(
      (l) {
        emit(state.copyWith(failure: l, status: ProfileStates.error));
      },
      (profile) {
        emit(state.copyWith(profile: profile, status: ProfileStates.success));
      },
    );
  }

  Future<void> getAdminProfile() async {
    emit(state.copyWith(status: ProfileStates.loading));

    final response = await _adminProfileUseCase(NoParams());
    response.fold(
          (l) {
        emit(state.copyWith(failure: l, status: ProfileStates.error));
      },
          (profile) {
        emit(state.copyWith(adminProfile: profile, status: ProfileStates.success));
      },
    );
  }

  Future<void> updateProfile(
    BuildContext context,
    UpdateProfileParams params,
  ) async {
    emit(state.copyWith(status: ProfileStates.loading));

    final response = await _updateProfileUseCase(params);
    response.fold(
      (l) {
        emit(state.copyWith(failure: l, status: ProfileStates.error));
        showSnackBar(
          context: context,
          message: l.errMessage,
          backgroundColor: Colors.red,
        );
      },
      (profile) async{
        emit(state.copyWith(status: ProfileStates.updateSuccess));
       await getProfile();
      },
    );
  }
}
