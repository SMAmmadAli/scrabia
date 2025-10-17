import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:scrabia/models/login_model.dart';
import 'package:scrabia/models/signup_model.dart';
import 'package:scrabia/services/api_services.dart';
import 'package:scrabia/services/endpoint.dart';

class AuthController with ChangeNotifier {
  final ApiServices _client = ApiServices();
  final Logger _logger = Logger();

  bool _loading = false;
  bool get loading => _loading;

  LoginModel? loginResponse;
  SignupModel? signupResponse;

  Future<LoginModel?> login(String email, String password) async {
    _setLoading(true);

    try {
      final response = await _client.post(
        Endpoints.login,
        data: {
          "email": email.trim(),
          "password": password.trim(),
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        loginResponse = LoginModel.fromJson(response.data);
        return loginResponse;
      } else {
        return null;
      }
    } on DioException catch (e) {
      _handleDioError(e, context: "Login");
      return null;
    } catch (e, st) {
      _logger.e('Unexpected error during login', error: e, stackTrace: st);
      return null;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> registerBasic({
    required String firstName,
    required String lastName,
    required String position,
    required String email,
    required String password,
    required String mobileNumber,
  }) async {
    _setLoading(true);

    try {
      final response = await _client.post(
        Endpoints.signup,
        data: {
          "firstName": firstName.trim(),
          "lastName": lastName.trim(),
          "position": position.trim(),
          "email": email.trim(),
          "password": password.trim(),
          "mobileNumber": mobileNumber.trim(),
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        signupResponse = SignupModel.fromJson(response.data);
        return signupResponse?.success ?? false;
      } else {
        _logger.w("Register failed with status ${response.statusCode}");
        return false;
      }
    } on DioException catch (e) {
      _handleDioError(e, context: "Register");
      return false;
    } catch (e, st) {
      _logger.e('Unexpected error during registration',
          error: e, stackTrace: st);
      return false;
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void _handleDioError(DioException e, {required String context}) {
    final statusCode = e.response?.statusCode;

    switch (statusCode) {
      case 400:
        _logger.w("Bad request: ${e.response?.data}");
        break;
      case 401:
        _logger.w("Unauthorized: Invalid credentials");
        break;
      case 500:
        _logger.w("Server error: ${e.response?.data}");
        break;
      default:
        _logger.w("Unexpected error: ${e.message}");
    }
  }
}
