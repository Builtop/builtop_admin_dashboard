import 'package:builtop_admin_dashboard/constants/const.dart';
import 'package:builtop_admin_dashboard/constants/numbers.dart';
import 'package:builtop_admin_dashboard/models/user.dart';
import 'package:builtop_admin_dashboard/services/admin_users.service.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class UsersMenuButton extends StatelessWidget {
  final BuildContext contextEx;
  final User user;
  final int returnToIndex;
  const UsersMenuButton(
      {required this.contextEx,
      required this.user,
      required this.returnToIndex,
      super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => user.status == 'Active'
          ? [
              PopupMenuItem(
                child: Text("Deactivate"),
                value: 2,
              ),
              PopupMenuItem(
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
                value: 3,
              ),
            ]
          : [
              PopupMenuItem(
                child: Text("Activate"),
                value: 1,
              ),
              PopupMenuItem(
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
                value: 3,
              ),
            ],
      onSelected: (index) {
        if (index == 1) {
          activateUser();
        } else if (index == 2) {
          deActivateUser();
        } else if (index == 3) {
          deleteUser();
        }
      },
    );
  }

  void activateUser() async {
    try {
      var result = await LoadingOverlay.showFutureLoadingDialog(
          context: contextEx,
          future: () => AdminUsersService.activateUser(user.id ?? ''));

      if (result.result?.success ?? false) {
        CoolAlert.show(
                width: NumbersConst.dialogWidth,
                context: contextEx,
                type: CoolAlertType.success,
                text: 'User Activate Successfully')
            .then((value) => autoTabRouter?.setActiveIndex(returnToIndex));
      } else {
        CoolAlert.show(
            width: NumbersConst.dialogWidth,
            context: contextEx,
            type: CoolAlertType.error,
            text: result.result?.errorMessage);
      }
    } catch (e) {
      CoolAlert.show(
          width: NumbersConst.dialogWidth,
          context: contextEx,
          type: CoolAlertType.error,
          text: e.toString());
    }
  }

  void deActivateUser() async {
    try {
      var result = await LoadingOverlay.showFutureLoadingDialog(
          context: contextEx,
          future: () => AdminUsersService.deActivateUser(user.id ?? ''));

      if (result.result?.success ?? false) {
        CoolAlert.show(
                width: NumbersConst.dialogWidth,
                context: contextEx,
                type: CoolAlertType.success,
                text: 'User Deactivate Successfully')
            .then((value) => autoTabRouter?.setActiveIndex(returnToIndex));
      } else {
        CoolAlert.show(
            width: NumbersConst.dialogWidth,
            context: contextEx,
            type: CoolAlertType.error,
            text: result.result?.errorMessage);
      }
    } catch (e) {
      CoolAlert.show(
          width: NumbersConst.dialogWidth,
          context: contextEx,
          type: CoolAlertType.error,
          text: e.toString());
    }
  }

  Future<void> deleteUser() async {
    try {
      bool? confirm;
      await CoolAlert.show(
          width: NumbersConst.dialogWidth,
          context: contextEx,
          type: CoolAlertType.confirm,
          onConfirmBtnTap: () {
            confirm = true;
          },
          onCancelBtnTap: () {
            confirm = false;
          },
          title: 'Are you sure you want to delete ?');

      if (confirm ?? false) {
        if (!contextEx.mounted) return;
        var result = await LoadingOverlay.showFutureLoadingDialog(
            context: contextEx,
            future: () => AdminUsersService.deleteUser(user.id ?? ''));

        if (result.result?.success ?? false) {
          if (!contextEx.mounted) return;

          CoolAlert.show(
                  width: NumbersConst.dialogWidth,
                  context: contextEx,
                  type: CoolAlertType.success,
                  text: 'User Deleted Successfully')
              .then((value) => autoTabRouter?.setActiveIndex(returnToIndex));
        } else {
          if (!contextEx.mounted) return;

          CoolAlert.show(
              width: NumbersConst.dialogWidth,
              context: contextEx,
              type: CoolAlertType.error,
              text: result.result?.errorMessage);
        }
      }
    } catch (e) {
      CoolAlert.show(
          width: NumbersConst.dialogWidth,
          context: contextEx,
          type: CoolAlertType.error,
          text: e.toString());
    }
  }
}
