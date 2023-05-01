import 'package:mahg_essential_package/mahg_essential_package.dart';

class AdminsService {
  static final ApiService _apiService = ApiService();
  static const String _url = 'http://64.225.91.35:8080/api/users/';

  static Future<ProcessResult> editAdmin(Map<String, dynamic> data) async {
    try {
      var result = await _apiService.httpPutEx('${_url}edit-admin', data);
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }
}
