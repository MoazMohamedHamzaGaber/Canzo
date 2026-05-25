import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/profile/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateProfileUseCase extends UseCase<bool, UpdateProfileParams> {
  final ProfileRepository _profileRepository;

  UpdateProfileUseCase(this._profileRepository);

  @override
  Future<Either<Failure, bool>> call(UpdateProfileParams params) async {
    return await _profileRepository.updateProfile(params);
  }
}

class UpdateProfileParams {
  final String username;
  final String email;
  final String phoneNumber;
  final String address;
  final String activityType;
  final String activityName;

  UpdateProfileParams({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.activityType,
    required this.activityName,
  });

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "phoneNumber": phoneNumber,
    "address": address,
    "activityType": activityType,
    "activityName": activityName,
  };
}