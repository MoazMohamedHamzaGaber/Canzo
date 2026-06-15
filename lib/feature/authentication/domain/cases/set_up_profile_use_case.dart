import 'package:dartz/dartz.dart';

import '../../../../core/abstract/use_case.dart';
import '../../../../core/error/failure.dart';
import '../repository/auth_repository.dart';

class SetupProfileUseCase extends UseCase<bool, SetupProfileParams> {
  final AuthRepository repository;

  SetupProfileUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(SetupProfileParams params) {
    return repository.setupProfile(params);
  }
}

class SetupProfileParams {
  final String address;
  final String activityType;
  final String activityName;
  final String phone;

  SetupProfileParams({
    required this.address,
    required this.activityType,
    required this.activityName,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      "address": address,
      "activityType": activityType,
      "activityName": activityName,
      "phoneNumber": phone,
    };
  }
}