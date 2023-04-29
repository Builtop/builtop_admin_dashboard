import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/modules/users/pendings/pending_users.controller.dart';
import 'package:builtop_admin_dashboard/widgets/form_fields.widget.dart';
import 'package:builtop_admin_dashboard/widgets/users_menu_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class PendingUsersDetailsPage
    extends MahgStatefulWidget<PendingUsersController> {
  const PendingUsersDetailsPage(
      {PendingUsersController? controllerEx, Key? key})
      : super(controllerEx, key: key);

  @override
  State<PendingUsersDetailsPage> createState() =>
      _PendingUsersDetailsPageState();
}

class _PendingUsersDetailsPageState
    extends MahgState<PendingUsersDetailsPage, PendingUsersController> {
  @override
  createController() {
    return PendingUsersController();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: (controller.pendingUser == null)
            ? const CircularProgressIndicator.adaptive()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          controller.pendingUser!.id!,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                      ),
                      UsersMenuButton(
                        contextEx: context,
                        returnToIndex: 1,
                        user: controller.pendingUser!,
                      )
                    ],
                  ),
                  FxBox.h24,
                  FormFieldsWidget(
                    isUpdate: true,
                    controller: controller,
                  ),
                  Row(
                    children: [
                      FxButton(
                        borderRadius: 4,
                        onPressed: () => controller.approveUserHandler(),
                        text: 'Approve',
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
