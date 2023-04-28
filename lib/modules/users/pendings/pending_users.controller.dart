import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/const.dart';
import 'package:builtop_admin_dashboard/constants/numbers.dart';
import 'package:builtop_admin_dashboard/modules/users/pendings/pending_users.model.dart';
import 'package:builtop_admin_dashboard/modules/users/pendings/pending_users.page.dart';
import 'package:builtop_admin_dashboard/modules/users/pendings/pending_users.service.dart';
import 'package:builtop_admin_dashboard/modules/users/pendings/pending_user_details.page.dart';
import 'package:builtop_admin_dashboard/services/admin_users.service.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class PendingUsersController extends MahgController {
  List<PendingUser>? pendingUsers;
  PendingUser? pendingUser;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void init(Widget page) {
    if (page is PendingUsersDetailsPage) {
      emailController = TextEditingController();
      passwordController = TextEditingController();
    }
  }

  @override
  Future initLate(Widget page) async {
    if (page is PendingUsersPage) {
      await getPendingUsersHandler();
    }
    if (page is PendingUsersDetailsPage) {
      await getPendingUserHandler();
    }
  }

  Future<void> getPendingUserHandler() async {
    await Future.delayed(Duration(milliseconds: 400));
    if ((context.routeData.queryParams.get('id') == null) ||
        (context.routeData.queryParams.get('id') == '')) return;

    ProcessResult result = await AdminUsersService.getUser(
        context.routeData.queryParams.get('id'));
    if (result.success) {
      try {
        pendingUser = PendingUser.fromJson(result.data);
        emailController.text = pendingUser?.email ?? '';
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

  Future<void> approveUserHandler() async {
    bool? confirm;
    await CoolAlert.show(
        width: NumbersConst.dialogWidth,
        context: context,
        type: CoolAlertType.confirm,
        onConfirmBtnTap: () {
          confirm = true;
        },
        onCancelBtnTap: () {
          confirm = false;
        },
        title: 'Are you sure you want to approve this user ?');

    if (confirm ?? false) {
      var result = await LoadingOverlay.showFutureLoadingDialog(
          context: context,
          future: () => AdminUsersService.approveUser(
              context.routeData.queryParams.get('id')));
      if (result.result?.success ?? false) {
        CoolAlert.show(
                width: NumbersConst.dialogWidth,
                context: context,
                type: CoolAlertType.success,
                text: 'User Approved Successfully')
            .then((value) => autoTabRouter?.setActiveIndex(5));
      } else {
        CoolAlert.show(
            width: NumbersConst.dialogWidth,
            context: context,
            type: CoolAlertType.error,
            text: result.result?.errorMessage);
      }
    }
  }

  Future<void> getPendingUsersHandler() async {
    ProcessResult result = await PendingUsersService.getPendingUsers();
    if (result.success) {
      try {
        pendingUsers = List<PendingUser>.from(
            result.data.map((e) => PendingUser.fromJson(e))).toList();
      } catch (err, t) {
        print('ERROR $err');
        print('ERROR TRACE $t');
      }
    } else {
      pendingUsers = [];
      CoolAlert.show(
          width: NumbersConst.dialogWidth,
          context: context,
          type: CoolAlertType.error,
          text: result.errorMessage);
    }
  }
}
