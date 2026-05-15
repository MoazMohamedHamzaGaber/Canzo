import 'package:canzo_app/core/api/api_consumer.dart';
import 'package:canzo_app/core/api/end_points.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource{
 Future<Either<Failure,bool>> signUp(SignUpParams params);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer _apiConsumer;

  AuthRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<Either<Failure,bool>> signUp(SignUpParams params) async {
    var result = await _apiConsumer.post(
      EndPoints.signup,
      options: Options(),
      data: params.toJson(),
    );

    return result.fold(
          (failure) => Left(failure),
          (response) {
        // // Store the auth token
        // SharedPreference.saveData(key: 'token', value: response['auth_token']);
        //
        // // Check if refreshToken is present in the response
        // if (response.containsKey('token')) {
        //   SharedPreference.saveData(key: 'refreshToken', value: response['token']);
        // } else {
        //   // Handle the case where refresh token is not present
        //   print('Refresh token is not available in the response');
        // }

        return Right(true);
      },
    );
  }


}
