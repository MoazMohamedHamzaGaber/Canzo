import 'package:canzo_app/core/api/print_helper.dart';
import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class ApiConsumer {
  const ApiConsumer();

  Future<http.StreamedResponse> sendMultipartRequest(
      http.MultipartRequest request,
      );

  Future<Either<Failure, dynamic>> get(
      String url, {
        Map<String, dynamic>? queryParameters,
        Options? options,
      });

  Future<Either<Failure, Map<String, dynamic>>> post(
      String url, {
        Map<String, dynamic>? data,
        FormData? formData,
        Map<String, dynamic>? queryParameters,
        Options? options,
      });

  Future<Either<Failure, Map<String, dynamic>>> put(
      String url, {
        Map<String, dynamic>? data,
        Map<String, dynamic>? queryParameters,
      });

  Future<Either<Failure, Map<String, dynamic>>> delete(
      String url, {
        Map<String, dynamic>? data,
        Map<String, dynamic>? queryParameters,
      });
}

class BaseApiConsumer extends ApiConsumer {
  final Dio _dio;

  BaseApiConsumer(this._dio);

  // ========================= Headers =========================

  Options _options([Options? options]) {
    return options ??
        Options(
          headers: {
            'Authorization': 'Token $token',
          },
        );
  }

  // ========================= Logger =========================

  void _logRequest({
    required String method,
    required String url,
    dynamic data,
    dynamic query,
    dynamic response,
  }) {
    pr('$method => $url', 'API');

    if (query != null) {
      pr(query, 'Query');
    }

    if (data != null) {
      pr(data, 'Body');
    }

    pr(response, 'Response');
  }

  // ========================= Response Handler =========================

  Either<Failure, Map<String, dynamic>> _mapResponse(
      Response response,
      ) {
    if (response.data is Map<String, dynamic>) {
      return Right(response.data as Map<String, dynamic>);
    }

    if (response.data is List) {
      return Right({
        'data': response.data,
      });
    }

    return Left(
      ValidationFailure(
        'Unexpected response format',
      ),
    );
  }

  // ========================= Multipart =========================

  @override
  Future<http.StreamedResponse> sendMultipartRequest(
      http.MultipartRequest request,
      ) async {
    return await request.send();
  }

  // ========================= GET =========================

  @override
  Future<Either<Failure, dynamic>> get(
      String url, {
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: _options(options),
      );

      _logRequest(
        method: 'GET',
        url: url,
        query: queryParameters,
        response: response.data,
      );

      return Right(response.data);
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  // ========================= POST =========================

  @override
  Future<Either<Failure, Map<String, dynamic>>> post(
      String url, {
        Map<String, dynamic>? data,
        FormData? formData,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      final response = await _dio.post(
        url,
        data: formData ?? data,
        queryParameters: queryParameters,
        options: _options(options),
      );

      _logRequest(
        method: 'POST',
        url: url,
        data: data,
        query: queryParameters,
        response: response.data,
      );

      return _mapResponse(response);
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  // ========================= PUT =========================

  @override
  Future<Either<Failure, Map<String, dynamic>>> put(
      String url, {
        Map<String, dynamic>? data,
        Map<String, dynamic>? queryParameters,
      }) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: _options(),
      );

      _logRequest(
        method: 'PUT',
        url: url,
        data: data,
        query: queryParameters,
        response: response.data,
      );

      if (response.statusCode == 204) {
        return const Right({});
      }

      return _mapResponse(response);
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  // ========================= DELETE =========================

  @override
  Future<Either<Failure, Map<String, dynamic>>> delete(
      String url, {
        Map<String, dynamic>? data,
        Map<String, dynamic>? queryParameters,
      }) async {
    try {
      final response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: _options(),
      );

      _logRequest(
        method: 'DELETE',
        url: url,
        data: data,
        query: queryParameters,
        response: response.data,
      );

      if (response.statusCode == 204) {
        return const Right({});
      }

      return _mapResponse(response);
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  // ========================= Error Handler =========================

  Failure _handleError(dynamic error) {
    pr(error.toString(), 'API ERROR');

    if (error is DioException) {
      return Failure.fromDioError(error);
    }

    return UnknownFailure(
      error.toString(),
    );
  }
}