import 'package:canzo_app/service_locator/auth_service_locator.dart';
import 'package:canzo_app/service_locator/history_service_locator.dart';
import 'package:canzo_app/service_locator/home_service_locator.dart';
import 'package:canzo_app/service_locator/profile_service_locator.dart';
import 'package:canzo_app/service_locator/wallet_service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import '../api/api_consumer.dart';
import '../api/end_points.dart';

final serviceLocator = GetIt.instance;

class DI {

  static Future<void> execute() async {
    serviceLocator.registerLazySingleton<Dio>(
          () => Dio(
        BaseOptions(
          baseUrl: kReleaseMode ? EndPoints.baseUrl : EndPoints.baseUrl,
          connectTimeout: const Duration(seconds: 60),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      ),
    );
    serviceLocator.registerLazySingleton<ApiConsumer>(
          () => BaseApiConsumer(
        serviceLocator(),
      ),
    );
    AuthServiceLocator.execute(serviceLocator);
    HomeServiceLocator.execute(serviceLocator);
    HistoryServiceLocator.execute(serviceLocator);
    WalletServiceLocator.execute(serviceLocator);
    ProfileServiceLocator.execute(serviceLocator);
  }
}
