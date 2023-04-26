import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/const.dart';
import 'package:builtop_admin_dashboard/constants/numbers.dart';
import 'package:builtop_admin_dashboard/main.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisor.model.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisor_details.page.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisors.page.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisors.service.dart';
import 'package:builtop_admin_dashboard/routes/app_routes.gr.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class SupervisorsController extends MahgController {
  List<Supervisor>? supervisors;
  Supervisor? supervisor;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;

  @override
  void init(Widget page) {
    if (page is SupervisorDetailsPage) {
      emailController = TextEditingController();
      passwordController = TextEditingController();
      formKey = GlobalKey<FormState>();
    }
  }

  @override
  Future initLate(Widget page) async {
    if (page is SupervisorsPage) {
      await getSupervisorsHandler();
    }
    if (page is SupervisorDetailsPage) {
      await getSupervisorHandler();
    }
  }

  Future<void> getSupervisorHandler() async {
    await Future.delayed(Duration(milliseconds: 400));
    if ((context.routeData.queryParams.get('id') == null) ||
        (context.routeData.queryParams.get('id') == '')) return;

    ProcessResult result = await SupervisorsService.getSupervisor(
        context.routeData.queryParams.get('id'));
    if (result.success) {
      try {
        supervisor = Supervisor.fromJson(result.data);
        emailController.text = supervisor?.email ?? '';
      } catch (err, t) {
        print('ERROR $err');
        print('ERROR TRACE $t');
      }
    } else {
      CoolAlert.show(
              width: NumbersConst.dialogWidth,
              context: context,
              type: CoolAlertType.error,
              text: result.errorMessage)
          .then((value) => autoTabRouter?.setActiveIndex(1));
    }
  }

  Future<void> getSupervisorsHandler({bool refresh = false}) async {
    ProcessResult result = await SupervisorsService.getSupervisors();
    if (result.success) {
      try {
        supervisors = List<Supervisor>.from(
            result.data.map((e) => Supervisor.fromJson(e))).toList();
      } catch (err, t) {
        print('ERROR $err');
        print('ERROR TRACE $t');
      }
    } else {
      supervisors = [];
      CoolAlert.show(
          width: NumbersConst.dialogWidth,
          context: context,
          type: CoolAlertType.error,
          text: result.errorMessage);
    }
    if (refresh) {
      setState();
    }
  }

  Future<void> addSupervisorHandler() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    var data = {'email': emailController.text};
    var result = await LoadingOverlay.showFutureLoadingDialog(
        context: context, future: () => SupervisorsService.addSupervisor(data));
    if (result.result?.success ?? false) {
      CoolAlert.show(
              width: NumbersConst.dialogWidth,
              context: context,
              type: CoolAlertType.success,
              text: 'Supervisor Added Successfully')
          .then((value) => autoTabRouter?.setActiveIndex(1));
    } else {
      CoolAlert.show(
          width: NumbersConst.dialogWidth,
          context: context,
          type: CoolAlertType.error,
          text: result.result?.errorMessage);
    }
  }
}
