import 'package:builtop_admin_dashboard/modules/dashboard/widgets/list_item.widget.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/widgets/montly_earning.widget.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/widgets/sales_analytics.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/widgets/sales_report.dart';
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
        ListitemWidget(),
        FxBox.h24,
        MonthlyearningWidget(),
        FxBox.h24,
        Responsive.isWeb(context)
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SalesReport(),
                  ),
                  FxBox.w24,
                  Expanded(
                    child: Salesanalytics(),
                  ),
                ],
              )
            : Column(
                children: [
                  SalesReport(),
                  FxBox.h24,
                  Salesanalytics(),
                ],
              ),
        FxBox.h24,
        TransactionWidget()
      ],
    );
  }

  @override
  DashboardController createController() {
    return widget.controller ?? DashboardController();
  }
}
