import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../DataSource/login_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository{

  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);


  @override
  Future<Either<Failure, bool>> signUp(SignUpParams params) {
      return _remoteDataSource.signUp(params);
  }
}