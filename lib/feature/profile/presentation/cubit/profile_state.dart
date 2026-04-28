
import 'dart:ui';

enum ProfileStates { loading, initial, error }

class ProfileState {
  final ProfileStates status;
  //final Failure? failure;
  //final Locale? locale;

  const ProfileState({
    this.status = ProfileStates.initial,
    //this.failure,
   // this.locale,
  });
  ProfileState copyWith({
    ProfileStates? status,
    //Failure? failure,
  //  Locale? locale,
  }) {
    return ProfileState(
      status: status ?? this.status,
      //failure: failure ?? this.failure,
    //  locale: locale ?? this.locale,
    );
  }
}
