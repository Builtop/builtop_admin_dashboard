import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/modules/users/admin/admins.page.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:builtop_admin_dashboard/utils/responsive.dart';
import 'package:builtop_admin_dashboard/widgets/form_fields.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

import 'admins.controller.dart';

class AdminDetailsPage extends MahgStatefulWidget<AdminsController> {
  const AdminDetailsPage({AdminsController? controllerEx, Key? key})
      : super(controllerEx, key: key);

  @override
  State<AdminDetailsPage> createState() => _AdminDetailsPageState();
}

class _AdminDetailsPageState
    extends MahgState<AdminDetailsPage, AdminsController> {
  @override
  createController() {
    return AdminsController();
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
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      'Edit Admin',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                  ),
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
                    onPressed: () => controller.editAdminHandler(),
                    text: 'Update',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
