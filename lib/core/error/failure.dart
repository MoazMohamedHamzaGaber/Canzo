import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);

  factory Failure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure(
          'Connection timeout with ApiServer',
        );

      case DioExceptionType.sendTimeout:
        return const ServerFailure(
          'Send timeout with ApiServer',
        );

      case DioExceptionType.receiveTimeout:
        return const ServerFailure(
          'Receive timeout with ApiServer',
        );

      case DioExceptionType.badCertificate:
        return const ServerFailure(
          'Bad certificate with ApiServer',
        );

      case DioExceptionType.cancel:
        return const ServerFailure(
          'Request was cancelled',
        );

      case DioExceptionType.connectionError:
        return const NoInternetFailure(
          'No internet connection',
        );

      case DioExceptionType.badResponse:
        return _handleResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );

      case DioExceptionType.unknown:
        if (dioException.message != null &&
            dioException.message!.contains('SocketException')) {
          return const NoInternetFailure(
            'No internet connection',
          );
        }

        return const UnknownFailure(
          'Unexpected error, please try again',
        );
    }
  }

  static Failure _handleResponse(
      int? statusCode,
      dynamic data,
      ) {
    final message = _extractMessage(data);

    switch (statusCode) {
      case 400:
        return ValidationFailure(
          message ?? 'Bad request',
        );

      case 401:
        return UnauthorizedFailure(
          message ?? 'Unauthorized',
        );

      case 403:
        return UnauthorizedFailure(
          message ?? 'Forbidden',
        );

      case 404:
        return const ServerFailure(
          'User not found',
        );

      case 500:
        return const ServerFailure(
          'Internal server error',
        );

      default:
        return ServerFailure(
          message ?? 'Oops! There was an error',
        );
    }
  }

  static String? _extractMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      if (data['error'] != null) {
        return data['error'].toString();
      }

      if (data['message'] != null) {
        return data['message'].toString();
      }

      if (data['non_field_errors'] is List &&
          data['non_field_errors'].isNotEmpty) {
        return data['non_field_errors'][0].toString();
      }
    }

    return null;
  }
}

class ServerFailure extends Failure {
  const ServerFailure(super.errMessage);
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.errMessage);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(super.errMessage);
}

class NoInternetFailure extends Failure {
  const NoInternetFailure(super.errMessage);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.errMessage);
}