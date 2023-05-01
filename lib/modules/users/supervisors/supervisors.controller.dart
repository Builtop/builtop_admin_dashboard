import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/const.dart';
import 'package:builtop_admin_dashboard/constants/numbers.dart';
import 'package:builtop_admin_dashboard/main.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisor.model.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisor_details.page.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisors.page.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisors.service.dart';
import 'package:builtop_admin_dashboard/routes/app_routes.gr.dart';
import 'package:builtop_admin_dashboard/services/admin_users.service.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class SupervisorsController extends MahgController {
  List<Supervisor>? supervisors;
  Supervisor? supervisor;

  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;

  @override
  void init(Widget page) {
    if (page is SupervisorDetailsPage) {
      emailController = TextEditingController();
      nameController = TextEditingController();
      phoneController = TextEditingController();
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

  Future<void> editSupervisorHandler() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    if (getChangedValues().keys.length == 1) {
      CoolAlert.show(
          width: NumbersConst.dialogWidth,
          context: context,
          type: CoolAlertType.info,
          text: 'No Data Changed');
      return;
    }

    var result = await LoadingOverlay.showFutureLoadingDialog(
        context: context,
        future: () => SupervisorsService.editSupervisor(getChangedValues()));

    if (result.result?.success ?? false) {
      CoolAlert.show(
              width: NumbersConst.dialogWidth,
              context: context,
              type: CoolAlertType.success,
              text: 'Data Edit Successfully')
          .then((value) {
        autoTabRouter?.setActiveIndex(1);
      });
    } else {
      CoolAlert.show(
              width: NumbersConst.dialogWidth,
              context: context,
              type: CoolAlertType.error,
              text: result.result?.errorMessage)
          .then((value) => autoTabRouter?.setActiveIndex(1));
    }
  }

  Map<String, dynamic> getChangedValues() {
    var data = {"_id": supervisor?.id};
    if (supervisor?.info?.email != emailController.text) {
      data['email'] = emailController.text;
    }
    if (supervisor?.phoneNum != phoneController.text) {
      data['phoneNum'] = phoneController.text;
    }
    if (supervisor?.info?.name != nameController.text) {
      data['name'] = nameController.text;
    }
    return data;
  }

  Future<void> getSupervisorHandler() async {
    await Future.delayed(Duration(milliseconds: 400));
    if ((context.routeData.queryParams.get('id') == null) ||
        (context.routeData.queryParams.get('id') == '')) return;

    ProcessResult result = await AdminUsersService.getUser(
        context.routeData.queryParams.get('id'));
    if (result.success) {
      try {
        supervisor = Supervisor.fromJson(result.data);
        emailController.text = supervisor?.info?.email ?? '';
        phoneController.text = supervisor?.phoneNum ?? '';
        nameController.text = supervisor?.info?.name ?? '';
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
    var data = {
      'email': emailController.text,
      'name': nameController.text,
      'phoneNum': phoneController.text,
    };
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
