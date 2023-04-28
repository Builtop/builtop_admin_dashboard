import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/dashboard.service.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/widgets/list_item.widget.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/widgets/sales_report.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/widgets/users_report.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/widgets/transaction.widget.dart';
import 'package:builtop_admin_dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

import 'dashboard.controller.dart';

class DashboardPage extends MahgStatefulWidget<DashboardController> {
  const DashboardPage({DashboardController? controllerEx, Key? key})
      : super(controllerEx, key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState
    extends MahgState<DashboardPage, DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        controller.dashboardData == null
            ? SizedBox(
                width: 50,
                height: 50,
                child: const CircularProgressIndicator.adaptive())
            : ListitemWidget(
                dashboardController: controller,
              ),
        FxBox.h24,
        FxBox.h24,
        Responsive.isWeb(context)
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getUsersReportWidget(),
                  FxBox.w24,
                  Expanded(
                    child: SalesReport(),
                  ),
                ],
              )
            : Column(
                children: [
                  getUsersReportWidget(isColumn: true),
                  FxBox.h24,
                  SalesReport(),
                ],
              ),
        FxBox.h24,
        TransactionWidget(),
        FxBox.h16,
        TransactionWidget(),
      ],
    );
  }

  Widget getUsersReportWidget({bool isColumn = false}) =>
      controller.dashboardData == null
          ? SizedBox(
              width: 50,
              height: 50,
              child: const CircularProgressIndicator.adaptive())
          : isColumn
              ? UsersReport(
                  dashboardController: controller,
                )
              : Expanded(
                  child: UsersReport(
                    dashboardController: controller,
                  ),
                );

  @override
  DashboardController createController() {
    return widget.controller ?? DashboardController();
  }
}
