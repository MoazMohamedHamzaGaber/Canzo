import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/profile/domain/UseCase/update_profile_use_case.dart';
import 'package:canzo_app/feature/profile/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateAdminProfileUseCase extends UseCase<bool, UpdateProfileParams> {
  final ProfileRepository _profileRepository;

  UpdateAdminProfileUseCase(this._profileRepository);

  @override
  Future<Either<Failure, bool>> call(UpdateProfileParams params) async {
    return await _profileRepository.updateAdminProfile(params);
  }
}