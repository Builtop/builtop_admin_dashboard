import 'package:mahg_essential_package/mahg_essential_package.dart';

class AdminUsersService {
  static final ApiService _apiService = ApiService();
  static const String _url = 'http://64.225.91.35:8080/api/users/';

  static Future<ProcessResult> approveUser(String id) async {
    try {
      var result =
          await _apiService.httpPutEx('${_url}approve-account', {"_id": id});
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> activateUser(String id) async {
    try {
      var result =
          await _apiService.httpPutEx('${_url}activate-account', {"_id": id});
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> deActivateUser(String id) async {
    try {
      var result =
          await _apiService.httpPutEx('${_url}deactivate-account', {"_id": id});
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> deleteUser(String id) async {
    try {
      var result = await _apiService.httpDeleteDynamicEx('${_url}user/$id');
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }
}
