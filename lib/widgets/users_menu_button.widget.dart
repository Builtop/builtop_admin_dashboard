import 'package:builtop_admin_dashboard/constants/const.dart';
import 'package:builtop_admin_dashboard/constants/numbers.dart';
import 'package:builtop_admin_dashboard/models/user.model.dart';
import 'package:builtop_admin_dashboard/services/admin_users.service.dart';
import 'package:builtop_admin_dashboard/widgets/dialogs/change_password_dialog.widget.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class UsersMenuButton extends StatelessWidget {
  final BuildContext contextEx;
  final User user;
  final int returnToIndex;
  final bool canChangePassword;
  final bool canChangePasswordOnly;
  const UsersMenuButton(
      {required this.contextEx,
      required this.user,
      required this.returnToIndex,
      this.canChangePassword = false,
      this.canChangePasswordOnly = false,
      super.key});

  List<PopupMenuEntry<int>> get listValues => user.status == 'Active'
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
        ];

  List<PopupMenuEntry<int>> get listValuesEx => canChangePasswordOnly
      ? [
          PopupMenuItem(
            child: Text(
              "Change Password",
            ),
            value: 4,
          ),
        ]
      : canChangePassword
          ? [
              ...listValues,
              PopupMenuItem(
                child: Text(
                  "Change Password",
                ),
                value: 4,
              ),
            ]
          : listValues;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => listValuesEx,
      onSelected: (index) async {
        if (index == 1) {
          activateUser();
        } else if (index == 2) {
          deActivateUser();
        } else if (index == 3) {
          AdminUsersService.deleteUserEx(
              context: contextEx,
              id: user.id ?? '',
              returnToIndex: returnToIndex);
        } else if (index == 4) {
          await showGeneralDialog(
              transitionDuration: Duration(milliseconds: 200),
              barrierDismissible: true,
              barrierLabel: '',
              context: context,
              pageBuilder: (context, animation1, animation2) {
                return const SizedBox.shrink();
              },
              transitionBuilder: (context, a1, a2, widget) => Transform.scale(
                    scale: a1.value,
                    child: Opacity(
                      opacity: a1.value,
                      child: Dialog(
                        insetAnimationCurve: Curves.bounceIn,
                        insetAnimationDuration: Duration(seconds: 1),
                        child: ChangePasswordDialog(
                          context: contextEx,
                          index: returnToIndex,
                          userId: user.id ?? '',
                        ),
                      ),
                    ),
                  ));
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
}
