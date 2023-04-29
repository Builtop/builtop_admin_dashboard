import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/constants/const.dart';
import 'package:builtop_admin_dashboard/constants/text.dart';
import 'package:builtop_admin_dashboard/modules/users/admins/admins.page.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisor.model.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisors.controller.dart';
import 'package:builtop_admin_dashboard/utils/responsive.dart';
import 'package:builtop_admin_dashboard/widgets/form_fields.widget.dart';
import 'package:builtop_admin_dashboard/widgets/users_menu_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';
import 'package:intl/intl.dart' as intl;

class SupervisorDetailsPage extends MahgStatefulWidget<SupervisorsController> {
  const SupervisorDetailsPage({SupervisorsController? controllerEx, Key? key})
      : super(controllerEx, key: key);

  @override
  State<SupervisorDetailsPage> createState() => _SupervisorDetailsPageState();
}

class _SupervisorDetailsPageState
    extends MahgState<SupervisorDetailsPage, SupervisorsController> {
  @override
  createController() {
    return SupervisorsController();
  }

  bool get loadingPage => ((context.routeData.queryParams.get('id') != null &&
          context.routeData.queryParams.get('id') != '') &&
      (controller.supervisor == null));
  bool get isUpdate => ((context.routeData.queryParams.get('id') != null &&
      context.routeData.queryParams.get('id') != ''));

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: loadingPage
            ? const CircularProgressIndicator.adaptive()
            : Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            controller.supervisor?.id ?? 'New Supervisor',
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                        isUpdate
                            ? UsersMenuButton(
                                contextEx: context,
                                returnToIndex: 1,
                                user: controller.supervisor!,
                              )
                            : const SizedBox.shrink()
                      ],
                    ),
                    FxBox.h24,
                    FormFieldsWidget(
                      isUpdate: isUpdate,
                      controller: controller,
                    ),
                    Row(
                      children: [
                        FxButton(
                          borderRadius: 4,
                          onPressed: controller.supervisor?.id == null
                              ? () => controller.addSupervisorHandler()
                              : () {},
                          text: controller.supervisor?.id == null
                              ? 'Add New'
                              : 'Update',
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
