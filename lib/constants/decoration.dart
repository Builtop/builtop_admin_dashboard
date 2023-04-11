import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:flutter/material.dart';

class DecorationEx {
  static BoxDecoration getBorderDecoration() {
    return BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: AppConfigService.isDark
                    ? Colors.white
                    : ColorConst.scaffoldDark)));
  }
}
