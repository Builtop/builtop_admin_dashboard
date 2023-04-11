import 'package:flutter/material.dart';
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
    return Container();
  }

  @override
  DashboardController createController() {
    return widget.controller ?? DashboardController();
  }
}
