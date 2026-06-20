import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/profile/domain/entity/profile_entity.dart';

enum ProfileStates { loading, initial, error, success ,updateSuccess, deleteSuccess}

class ProfileState {
  final ProfileStates status;
  final Failure? failure;
  final ProfileEntity? profile;
  final ProfileEntity? adminProfile;

  const ProfileState({
    this.status = ProfileStates.initial,
    this.failure,
    this.profile,
    this.adminProfile,
  });
  ProfileState copyWith({
    ProfileStates? status,
    Failure? failure,
   ProfileEntity? profile,
   ProfileEntity? adminProfile,
  }) {
    return ProfileState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      profile: profile ?? this.profile,
      adminProfile: adminProfile ?? this.adminProfile,
    );
  }
}
