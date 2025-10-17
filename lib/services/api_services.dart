import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ApiServices {
  // --- Singleton pattern ---
  static final ApiServices _instance = ApiServices._internal();
  factory ApiServices() => _instance;

  // --- Dio instance ---
  late final Dio _dio;

  // --- Logger instance ---
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 5,
      lineLength: 100,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  // --- Private constructor ---
  ApiServices._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.0.105:3001',
        // connectTimeout: const Duration(seconds: 10),
        // receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // --- Add interceptors for logging and debugging ---
    _dio.interceptors.add(InterceptorsWrapper(
      // onRequest: (options, handler) {
      //   debugPrint('╔════════════════════════════════════════════════════════════');
      //   debugPrint('║ 🚀 REQUEST');
      //   debugPrint('╠════════════════════════════════════════════════════════════');
      //   debugPrint('║ METHOD: ${options.method}');
      //   debugPrint('║ URL: ${options.baseUrl}${options.path}');
      //   debugPrint('║ HEADERS: ${options.headers}');
      //   if (options.queryParameters.isNotEmpty) {
      //     debugPrint('║ QUERY PARAMETERS: ${options.queryParameters}');
      //   }
      //   if (options.data != null) {
      //     debugPrint('║ REQUEST BODY: ${options.data}');
      //   }
      //   debugPrint('╚════════════════════════════════════════════════════════════');
      //   return handler.next(options);
      // },
      onResponse: (response, handler) {
        debugPrint('╔════════════════════════════════════════════════════════════');
        debugPrint('║ RESPONSE');
        debugPrint('╠════════════════════════════════════════════════════════════');
        debugPrint('║ STATUS CODE: ${response.statusCode}');
        debugPrint(
            '║ URL: ${response.requestOptions.baseUrl}${response.requestOptions.path}');
        debugPrint('║ RESPONSE BODY: ${response.data}');
        debugPrint('╚════════════════════════════════════════════════════════════');
        return handler.next(response);
      },
    //   onError: (error, handler) {
    //     debugPrint('╔════════════════════════════════════════════════════════════');
    //     debugPrint('║ ERROR');
    //     debugPrint('╠════════════════════════════════════════════════════════════');
    //     debugPrint(
    //         '║ URL: ${error.requestOptions.baseUrl}${error.requestOptions.path}');
    //     debugPrint('║ METHOD: ${error.requestOptions.method}');
    //     debugPrint('║ ERROR TYPE: ${error.type}');
    //     debugPrint('║ ERROR MESSAGE: ${error.message}');
    //     debugPrint('║ STATUS CODE: ${error.response?.statusCode}');
    //     debugPrint('║ RESPONSE: ${error.response?.data}');
    //     debugPrint('╚════════════════════════════════════════════════════════════');
    //     return handler.next(error);
    //   },
    ));
  }

  // --- Generic HTTP methods ---

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Options? options,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        options: options,
      );
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Options? options,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: data,
        options: options,
      );
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Options? options,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        options: options,
      );
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // --- Centralized error handling ---
  void _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        _logger.e('Connection Timeout');
        break;
      case DioExceptionType.receiveTimeout:
        _logger.e('Receive Timeout');
        break;
      case DioExceptionType.badResponse:
        _logger.e('Bad Response: ${error.response?.statusCode}');
        break;
      case DioExceptionType.connectionError:
        _logger.e('Connection Error: ${error.message}');
        break;
      default:
        _logger.e('Unknown Error: ${error.message}');
        break;
    }
  }

  // --- Optional: For custom headers like Auth Token ---
  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void clearAuthToken() {
    _dio.options.headers.remove('Authorization');
  }
}
