import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/dashboard.model.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/dashboard.page.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/dashboard.service.dart';
import 'package:builtop_admin_dashboard/modules/login/login.page.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';
import 'package:builtop_admin_dashboard/routes/app_routes.gr.dart' as gr;

class DashboardController extends MahgController {
  Dashboard? dashboardData;
  @override
  void init(Widget page) {}

  @override
  Future initLate(Widget page) async {
    if (page is DashboardPage) {
      await getData();
    }
  }

  Future<void> getData() async {
    var result = await DashboardService.getDashboardStatistics();
    if (result.success) {
      dashboardData = Dashboard.fromJson(result.data);
      print(dashboardData?.usersNum);
      print(dashboardData?.adminsNum);
    } else {
      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: result.errorMessage);
    }
  }

  // @override
  // Future<void> onDisplayed(Widget page, bool isDisplayed) async {
  //   await Future.delayed(Duration(milliseconds: 400));
  //   if (!AppConfigService.isLogin) {
  //     context.navigateTo(gr.LoginRoute());
  //   }
  //   return super.onDisplayed(page, isDisplayed);
  // }
}
