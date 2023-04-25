import 'package:auto_route/auto_route.dart';
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
  final TextEditingController emailController = TextEditingController();

  @override
  void init(Widget page) {}

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
          context: context,
          type: CoolAlertType.error,
          text: result.errorMessage);
    }
  }

  Future<void> getSupervisorsHandler() async {
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
          context: context,
          type: CoolAlertType.error,
          text: result.errorMessage);
    }
  }
}
