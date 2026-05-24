import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/profile/domain/entity/profile_entity.dart';

enum ProfileStates { loading, initial, error, success ,updateSuccess}

class ProfileState {
  final ProfileStates status;
  final Failure? failure;
  final ProfileEntity? profile;

  const ProfileState({
    this.status = ProfileStates.initial,
    this.failure,
    this.profile,
  });
  ProfileState copyWith({
    ProfileStates? status,
    Failure? failure,
   ProfileEntity? profile,
  }) {
    return ProfileState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      profile: profile ?? this.profile,
    );
  }
}
