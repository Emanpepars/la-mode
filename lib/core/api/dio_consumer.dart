import 'package:dio/dio.dart';
import 'package:la_mode/core/api/api_consumer.dart';
import 'package:la_mode/core/error/server_failure.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio});

  @override
  Future delete(path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      print(response.data);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerFailures(
        'Connection to the server timed out.',
      );

    case DioExceptionType.sendTimeout:
      throw ServerFailures('Send timed out');

    case DioExceptionType.receiveTimeout:
      throw ServerFailures('Receive timed out');

    case DioExceptionType.badCertificate:
      throw ServerFailures('Bad Certificate');

    case DioExceptionType.cancel:
      throw ServerFailures(
        'Request cancelled.',
      );

    case DioExceptionType.connectionError:
      throw ServerFailures(
        'Unable to connect to the server, please make sure you are connected to the internet and try again.',
      );

    case DioExceptionType.unknown:
      throw ServerFailures(
        'An unknown error occurred.',
      );
    case DioExceptionType.badResponse:
      switch (e.response!.statusCode) {
        case 400:
          throw ServerFailures(e.response?.data['errors']['msg']);
        case 401:
          ServerFailures(e.response?.data['message']);
        case 403:
          ServerFailures('server error');
        case 404:
          ServerFailures('server error');
        case 409:
          throw ServerFailures(e.response?.data['message']);
        case 422:
          ServerFailures('server error');
        case 504:
          ServerFailures('server error');
      }
  }
}
