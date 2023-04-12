import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class AppConfigService {
  final ValueNotifier<String> _language =
      ValueNotifier<String>(AppConfigService.language);

  static bool isLogin = false;

  // static UserData? _user;
  // static List<Locale>? supportedAppLocale;

  // static TokenData? _tokendata;
  // static ValueNotifier<int> progressNotifier = ValueNotifier(0);
  static ValueNotifier<bool> darkNotifier = ValueNotifier(isDark);

  // static TokenData? get tokenData => _tokendata;

  // static set tokenData(TokenData? v) => _tokendata = v;

  // static void setUserData(Map<String, dynamic> v) {
  //   _user = UserData.fromJson(v);
  // }

  static bool get isDark => ConfigService.getValueBool('is_dark');

  static set isDark(bool result) {
    darkNotifier.value = result;
    ConfigService.setValueBool('is_dark', result);
  }

  // static UserData? get user => _user;
  static String get language => ConfigService.getValueString('language');
  static set language(v) => ConfigService.setValueString('language', v);
  static bool get isArabic {
    if (language == 'ar') {
      return true;
    } else {
      return false;
    }
  }
}
