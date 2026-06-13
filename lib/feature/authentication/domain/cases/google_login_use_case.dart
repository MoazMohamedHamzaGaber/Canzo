import 'package:dartz/dartz.dart';

import '../../../../core/abstract/use_case.dart';
import '../../../../core/error/failure.dart';
import '../entity/login_entity.dart';
import '../repository/auth_repository.dart';

class GoogleLoginUseCase extends UseCase<LoginEntity, GoogleLoginParams> {
  final AuthRepository _authRepository;

  GoogleLoginUseCase(this._authRepository);

  @override
  Future<Either<Failure, LoginEntity>> call(GoogleLoginParams params) {
    return _authRepository.googleLogin(params);
  }
}

class GoogleLoginParams {
  final String idToken;

  GoogleLoginParams({required this.idToken});

  Map<String, dynamic> toJson() {
    return {"idToken": idToken};
  }
}
