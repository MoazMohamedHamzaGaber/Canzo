import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/profile/domain/entity/profile_entity.dart';
import 'package:canzo_app/feature/profile/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetProfileUseCase extends UseCase<ProfileEntity, NoParams> {
  final ProfileRepository _profileRepository;

  GetProfileUseCase(this._profileRepository);

  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams params) async {
    return await _profileRepository.getProfile();
  }
}