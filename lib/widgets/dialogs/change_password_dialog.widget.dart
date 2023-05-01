import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/constants/const.dart';
import 'package:builtop_admin_dashboard/constants/numbers.dart';
import 'package:builtop_admin_dashboard/services/admin_users.service.dart';
import 'package:builtop_admin_dashboard/utils/responsive.dart';
import 'package:builtop_admin_dashboard/widgets/custom_text_field_ex.widget.dart';
import 'package:builtop_admin_dashboard/widgets/form_fields.widget.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class ChangePasswordDialog extends StatefulWidget {
  final String userId;
  final int index;
  final BuildContext context;
  const ChangePasswordDialog(
      {required this.userId,
      required this.index,
      required this.context,
      Key? key})
      : super(key: key);

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late GlobalKey<FormState> globalKey;
  final String currentPassword = 'current password';
  final String newPassword = 'new password';

  @override
  void initState() {
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    globalKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height / 2 + 50,
          maxWidth: MediaQuery.of(context).size.width / 2 + 50),
      child: Card(
        shadowColor: ColorConst.primary.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Change Password',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                FxBox.h24,
                formWidget(),
                Row(
                  children: [
                    FxButton(
                      borderRadius: 4,
                      onPressed: () => onConfirmChangePassword(),
                      text: 'Confirm',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onConfirmChangePassword() async {
    try {
      if (!(globalKey.currentState?.validate() ?? false)) return;
      // remove change password dialog
      Navigator.pop(context);
      var result = await LoadingOverlay.showFutureLoadingDialog(
          context: widget.context,
          future: () => AdminUsersService.changePassword(widget.userId,
              currentPassword: currentPasswordController.text,
              newPassword: newPasswordController.text));

      if (result.result?.success ?? false) {
        CoolAlert.show(
                width: NumbersConst.dialogWidth,
                context: widget.context,
                type: CoolAlertType.success,
                text: 'Password Changed Successfully Successfully')
            .then((value) => autoTabRouter?.setActiveIndex(widget.index));
      } else {
        CoolAlert.show(
            width: NumbersConst.dialogWidth,
            context: widget.context,
            type: CoolAlertType.error,
            text: result.result?.errorMessage);
      }
    } catch (e) {
      CoolAlert.show(
          width: NumbersConst.dialogWidth,
          context: widget.context,
          type: CoolAlertType.error,
          text: e.toString());
    }
  }

  Widget formWidget() {
    return (Responsive.isWeb(context))
        ? Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _commonText(currentPassword, context),
                        FxBox.h4,
                        _listBox(currentPassword,
                            controller: currentPasswordController,
                            validatorEx: (value) =>
                                currenPasswordValidator(value)),
                      ],
                    ),
                  ),
                  FxBox.w16,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _commonText(newPassword, context),
                        FxBox.h4,
                        _listBox(newPassword,
                            controller: newPasswordController,
                            validatorEx: (value) =>
                                newPasswordValidator(value)),
                      ],
                    ),
                  ),
                ],
              ),
              FxBox.h16,
            ],
          )
        : (!Responsive.isWeb(context))
            ? Column(
                children: [
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _responsive(
                          _commonText(currentPassword, context),
                          _listBox(currentPassword,
                              controller: currentPasswordController,
                              validatorEx: (value) =>
                                  currenPasswordValidator(value))),
                      _responsive(
                          _commonText(newPassword, context),
                          _listBox(newPassword,
                              controller: newPasswordController,
                              validatorEx: (value) =>
                                  newPasswordValidator(value))),
                    ],
                  ),
                  FxBox.h16,
                ],
              )
            : const SizedBox.shrink();
  }

  Widget _responsive(Widget childOne, Widget childTwo) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [childOne, FxBox.h4, childTwo],
      ),
    );
  }

  Widget _commonText(String text, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Responsive.isMobile(context) ? 8.0 : 0.0,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  String? currenPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'current password required';
    }
    return null;
  }

  String? newPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'new password required';
    }

    return null;
  }

  Widget _listBox(
    String hintText, {
    required TextEditingController? controller,
    required String? Function(String?)? validatorEx,
  }) {
    return SizedBox(
      // height: 30,
      child: CustomTextFieldEx(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        obscureText: true,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        hintText: hintText,
        validator: validatorEx,
      ),
    );
  }
}
