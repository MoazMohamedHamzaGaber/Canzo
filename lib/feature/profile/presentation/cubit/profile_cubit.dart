import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  // void changeLanguage(BuildContext context, Locale locale) {
  //   context.setLocale(locale);
  //
  //   emit(
  //     state.copyWith(locale: locale),
  //   );
  // }
}
