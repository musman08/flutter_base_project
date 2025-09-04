import 'package:dio/dio.dart';

class Api {
  static final client =
      Dio(
          BaseOptions(
            headers: {"Content-Type": "application/json"},
            baseUrl: '',
            connectTimeout: const Duration(seconds: 120000),
            receiveTimeout: const Duration(seconds: 120000),
          ),
        )
        ..httpClientAdapter = HttpClientAdapter()
        ..interceptors.add(ApiErrorInterceptor());
}

class ApiErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;
    final message = response?.data is Map<String, dynamic>
        ? response?.data['message']?.toString()
        : err.message;
    final serverCode = response?.data is Map<String, dynamic>
        ? response?.data['code']?.toString()
        : null;

    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        message: message ?? 'Unknown error',
        response: response,
        error: ApiError(
          code: response?.statusCode ?? 500,
          message: message ?? 'Unknown error',
          serverCode: serverCode,
        ),
      ),
    );
  }
}

class ApiError implements Exception {
  final int code;
  final String message;
  final String? serverCode;

  ApiError({required this.code, required this.message, this.serverCode});

  @override
  String toString() => 'ApiError($code): $message';
}
