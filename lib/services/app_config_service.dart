import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/models/user.model.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisor.model.dart';
import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class AppConfigService {
  final ValueNotifier<String> _language =
      ValueNotifier<String>(AppConfigService.language);

  // static List<Locale>? supportedAppLocale;

  // static TokenData? _tokendata;
  // static ValueNotifier<int> progressNotifier = ValueNotifier(0);
  static ValueNotifier<bool> darkNotifier = ValueNotifier(isDark);

  // static TokenData? get tokenData => _tokendata;

  // static set tokenData(TokenData? v) => _tokendata = v;

  static void setUserData(Map<String, dynamic> v) {
    ConfigService.setValueMap('user', v);
  }

  static bool get isDark => ConfigService.getValueBool('is_dark');

  static set isDark(bool result) {
    darkNotifier.value = result;
    ConfigService.setValueBool('is_dark', result);
  }

  static UserEx? get user => ConfigService.getValueMap('user').isEmpty
      ? null
      : UserEx.fromJson(ConfigService.getValueMap('user'));
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

class UserEx extends User {
  UserEx();

  UserEx.fromJson(Map<String, dynamic> data) {
    fromJson(data);
  }
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return super.toJson();
  }
}
