import 'package:mahg_essential_package/mahg_essential_package.dart';

class DashboardService {
  static final ApiService _apiService = ApiService();
  static const String _url = 'http://64.225.91.35:8080/api/users/';

  static Future<void> testFunction() async {
    var result = await _apiService.httpPostEx(
        'http://64.225.91.35:8080/api/users/login',
        {"email": "test@test.com", "password": "00000000"},
        {},
        false);

    if (result.success) {
      print(result.data);
      print(result.token);
    }
  }

  static Future<ProcessResult> getDashboardStatistics() async {
    try {
      var result = await _apiService.httpGetDynamic(
        '${_url}statistics',
      );
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }
}
