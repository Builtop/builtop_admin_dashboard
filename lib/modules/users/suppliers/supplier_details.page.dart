import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/constants/decoration.dart';
import 'package:builtop_admin_dashboard/constants/icons.dart';
import 'package:builtop_admin_dashboard/constants/text.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:builtop_admin_dashboard/widgets/custom_sync_fusion_table.widget.dart';
import 'package:builtop_admin_dashboard/widgets/custom_text_field_ex.widget.dart';
import 'package:builtop_admin_dashboard/widgets/form_fields.widget.dart';
import 'package:builtop_admin_dashboard/widgets/svg_icon.dart';
import 'package:builtop_admin_dashboard/widgets/users_menu_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'suppliers.controller.dart';

import 'package:intl/intl.dart' as intl;

class SupplierDetailsPage extends MahgStatefulWidget<SuppliersController> {
  const SupplierDetailsPage({SuppliersController? controllerEx, Key? key})
      : super(controllerEx, key: key);

  @override
  State<SupplierDetailsPage> createState() => _SupplierDetailsPageState();
}

class _SupplierDetailsPageState
    extends MahgState<SupplierDetailsPage, SuppliersController> {
  @override
  createController() {
    return SuppliersController();
  }

  bool get loadingPage => ((context.routeData.queryParams.get('id') != null &&
          context.routeData.queryParams.get('id') != '') &&
      (controller.supplier == null));
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
                            controller.supplier?.id ?? 'New Supplier',
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                        isUpdate
                            ? UsersMenuButton(
                                contextEx: context,
                                returnToIndex: 1,
                                user: controller.supplier!,
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
                          onPressed:
                              controller.supplier?.id == null ? () {} : () {},
                          text: controller.supplier?.id == null
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
