import 'package:mahg_essential_package/mahg_essential_package.dart';

class SupervisorsService {
  static final ApiService _apiService = ApiService();
  static const String _url = 'http://64.225.91.35:8080/api/users/';

  static Future<ProcessResult> getSupervisors({skip = 0, limit = 15}) async {
    try {
      var result = await _apiService.httpGetDynamic(
        '${_url}supervisors?skip=$skip&limit=$limit',
      );
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> getSupervisor(String id) async {
    try {
      var result = await _apiService.httpGetDynamic(
        '${_url}user/$id',
      );
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }
}
