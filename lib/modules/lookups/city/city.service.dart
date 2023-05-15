import 'package:mahg_essential_package/mahg_essential_package.dart';

class CityService {
  static final ApiService _apiService = ApiService();
  static const String _url =
      'http://143.244.211.131:8080/api/lookups-dictionary/api/';

  static Future<ProcessResult> getCities({skip = 0, limit = 15}) async {
    try {
      var result = await _apiService.httpGetDynamic(
        '${_url}city?skip=$skip&limit=$limit',
      );
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> addCity(
      Map<String, dynamic> data, String countryId) async {
    try {
      var result = await _apiService.httpPostEx('${_url}city/$countryId', data);
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> editCity(
    Map<String, dynamic> data,
  ) async {
    try {
      var result =
          await _apiService.httpPutEx('${_url}city/${data["_id"]}', data);
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> deleteCity(String id) async {
    try {
      var result = await _apiService.httpDeleteDynamicEx(
        '${_url}city/$id',
      );
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> getCityById(String id) async {
    try {
      var result = await _apiService.httpGetDynamic(
        '${_url}city/$id',
      );
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }
}
