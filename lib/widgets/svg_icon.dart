import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? size;
  const SvgIcon({Key? key, required this.icon, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      color: _color(AppConfigService.isDark),
      width: size ?? 20,
      height: size ?? 20,
    );
  }

  Color? _color(bool themeMode) {
    if (color == null) return themeMode ? ColorConst.white : ColorConst.black;
    return color;
  }
}
