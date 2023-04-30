import 'package:mahg_essential_package/mahg_essential_package.dart';

class AuthService {
  static final ApiService _apiService = ApiService();
  static const String _url = 'http://64.225.91.35:8080/api/users/';

  static Future<ProcessResult> login(Map<String, dynamic> data) async {
    try {
      var result = await _apiService.httpPostEx('${_url}login', data);
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> signup(Map<String, dynamic> data) async {
    try {
      var result = await _apiService.httpPostEx('${_url}signup', data);
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> validateOtp(Map<String, dynamic> data) async {
    try {
      var result = await _apiService.httpPostEx('${_url}validate-otp', data);
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> forgetPassword(Map<String, dynamic> data) async {
    try {
      var result = await _apiService.httpPostEx('${_url}forget-password', data);
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> resetPassword(Map<String, dynamic> data) async {
    try {
      var result = await _apiService.httpPostEx('${_url}reset-password', data);
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }
}
