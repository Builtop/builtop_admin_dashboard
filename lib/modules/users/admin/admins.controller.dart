import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/const.dart';
import 'package:builtop_admin_dashboard/constants/numbers.dart';
import 'package:builtop_admin_dashboard/modules/users/admin/admin_details.page.dart';
import 'package:builtop_admin_dashboard/modules/users/admin/admins.service.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class AdminsController extends MahgController {
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController nameController;
  late TextEditingController passwordController;

  @override
  void init(Widget page) {
    if (page is AdminDetailsPage) {
      emailController =
          TextEditingController(text: AppConfigService.user?.info?.email);
      nameController =
          TextEditingController(text: AppConfigService.user?.info?.name);
      phoneController =
          TextEditingController(text: AppConfigService.user?.phoneNum);
      passwordController = TextEditingController();
    }
  }

  @override
  Future initLate(Widget page) async {}

  Future<void> editAdminHandler() async {
    var data = {"_id": AppConfigService.user?.id, "name": nameController.text};

    var result = await LoadingOverlay.showFutureLoadingDialog(
        context: context, future: () => AdminsService.editAdmin(data));

    if (result.result?.success ?? false) {
      CoolAlert.show(
              width: NumbersConst.dialogWidth,
              context: context,
              type: CoolAlertType.success,
              text: 'Data Edit Successfully')
          .then((value) {
        AppConfigService.setUserData(result.result?.data);
        autoTabRouter?.setActiveIndex(0);
      });
    } else {
      CoolAlert.show(
              width: NumbersConst.dialogWidth,
              context: context,
              type: CoolAlertType.error,
              text: result.result?.errorMessage)
          .then((value) => autoTabRouter?.setActiveIndex(0));
    }
  }
}
