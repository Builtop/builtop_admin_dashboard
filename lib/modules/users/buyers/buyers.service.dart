import 'package:mahg_essential_package/mahg_essential_package.dart';

class BuyersService {
  static final ApiService _apiService = ApiService();
  static const String _url = 'http://64.225.91.35:8080/api/users/';
  static Future<ProcessResult> getBuyers({skip = 0, limit = 15}) async {
    try {
      var result = await _apiService.httpGetDynamic(
        '${_url}buyers?skip=$skip&limit=$limit',
      );
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }
}
