import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/const.dart';
import 'package:builtop_admin_dashboard/constants/numbers.dart';
import 'package:builtop_admin_dashboard/modules/login/login.page.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:builtop_admin_dashboard/services/auth.service.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class LoginController extends MahgController {
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;

  @override
  void init(Widget page) {
    if (page is LoginPage) {
      phoneController = TextEditingController();
      passwordController = TextEditingController();
      formKey = GlobalKey<FormState>();
    }
  }

  @override
  Future initLate(Widget page) async {}

  void onLogin() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    var result = await LoadingOverlay.showFutureLoadingDialog(
        context: context,
        future: () => AuthService.login({
              "phoneNum": phoneController.text,
              "password": passwordController.text
            }));

    if (result.result?.success ?? false) {
      CoolAlert.show(
              width: NumbersConst.dialogWidth,
              context: context,
              type: CoolAlertType.success,
              text: 'You Logged in Successfully')
          .then((value) {
        ConfigService.token = result.result?.token;
        AppConfigService.setUserData(result.result?.data);
        print(AppConfigService.user?.toJson());
        context.popRoute();
      });
    } else {
      CoolAlert.show(
          width: NumbersConst.dialogWidth,
          context: context,
          type: CoolAlertType.error,
          text: result.result?.errorMessage);
    }
  }
}
