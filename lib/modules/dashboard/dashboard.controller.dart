import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/modules/login/login.page.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';
import 'package:builtop_admin_dashboard/routes/app_routes.gr.dart' as gr;

class DashboardController extends MahgController {
  @override
  void init(Widget page) {}

  @override
  Future initLate(Widget page) async {}

  @override
  Future<void> onDisplayed(Widget page, bool isDisplayed) async {
    await Future.delayed(Duration(milliseconds: 400));

    print('=========================== In on display');
    if (!AppConfigService.isLogin) {
      context.navigateTo(gr.LoginRoute());
    }
    return super.onDisplayed(page, isDisplayed);
  }
}
