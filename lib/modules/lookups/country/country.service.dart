import 'package:mahg_essential_package/mahg_essential_package.dart';

class CountryService {
  static final ApiService _apiService = ApiService();
  static const String _url =
      'http://143.244.211.131:8080/api/lookups-dictionary/api/';

  static Future<ProcessResult> getCountries({skip = 0, limit = 15}) async {
    try {
      var result = await _apiService.httpGetDynamic(
        '${_url}country?skip=$skip&limit=$limit',
      );
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> addCountry(Map<String, dynamic> data) async {
    try {
      var result = await _apiService.httpPostEx('${_url}country', data);
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> editCountry(
    Map<String, dynamic> data,
  ) async {
    try {
      var result =
          await _apiService.httpPutEx('${_url}country/${data["_id"]}', data);
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> deleteCountry(String id) async {
    try {
      var result = await _apiService.httpDeleteDynamicEx(
        '${_url}country/$id',
      );
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> getCountryById(String id) async {
    try {
      var result = await _apiService.httpGetDynamic(
        '${_url}country/$id',
      );
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }
}
