import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/constants/decoration.dart';
import 'package:builtop_admin_dashboard/constants/icons.dart';
import 'package:builtop_admin_dashboard/constants/numbers.dart';
import 'package:builtop_admin_dashboard/constants/text.dart';
import 'package:builtop_admin_dashboard/modules/lookups/city/city.service.dart';
import 'package:builtop_admin_dashboard/services/admin_users.service.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:builtop_admin_dashboard/widgets/custom_sync_fusion_table.widget.dart';
import 'package:builtop_admin_dashboard/widgets/custom_text_field_ex.widget.dart';
import 'package:builtop_admin_dashboard/widgets/svg_icon.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:intl/intl.dart' as intl;
import 'city.controller.dart';

class CityPage extends MahgStatefulWidget<CityController> {
  const CityPage({CityController? controllerEx, Key? key})
      : super(controllerEx, key: key);

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends MahgState<CityPage, CityController> {
  @override
  createController() {
    return CityController();
  }

  Widget get getTable => (controller.cities == null)
      ? const CircularProgressIndicator.adaptive()
      : (controller.cities?.isEmpty ?? false)
          ? ConstText.lightText(
              text: 'No Data Found',
              fontWeight: FontWeight.bold,
            )
          : CustomSyncFusionTable(
              key: UniqueKey(),
              rowHeights: 70,
              columnsWithOptionalWidth: {'actions': 200},
              fieldToColumnName: {
                "_id": 'id',
                "name": 'name',
                "createdUser": 'createdUser',
                "status": 'status',
                'actions': 'actions'
              },
              generalList: controller.cities
                      ?.map((e) => {
                            ...e.toJson(),
                            'actions': e.id,
                            'createdUser': e.createdUser?.email,
                            'name': e.name?[AppConfigService.language]
                          })
                      .toList() ??
                  [],
              buildCells: (row) {
                return DataGridRowAdapter(
                    cells: row.getCells().map((e) {
                  if (e.columnName == 'actions') {
                    return _viewButton(e.value);
                  }
                  if (e.columnName == 'createdAt') {
                    return Container(
                        decoration: DecorationEx.getBorderDecoration(),
                        child: Center(
                            child: Text(intl.DateFormat('yyyy-MM-dd HH:mm a')
                                .format(e.value))));
                  }
                  if (e.columnName == 'status') {
                    return Container(
                        decoration: DecorationEx.getBorderDecoration(),
                        child: Center(
                            child: Text(
                          e.value.toString(),
                          style: TextStyle(
                              color: e.value.toString() == 'Active'
                                  ? Colors.green
                                  : Colors.red),
                        )));
                  }
                  return Container(
                      decoration: DecorationEx.getBorderDecoration(),
                      child: Center(child: Text(e.value.toString())));
                }).toList());
              },
              context: context);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          shadowColor: ColorConst.primary.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 7,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ConstText.lightText(
                      text: 'Cities',
                      fontWeight: FontWeight.bold,
                    ),
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text("Add New"),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text("Export"),
                          value: 2,
                        )
                      ],
                      onSelected: (index) {
                        if (index == 1) {
                          context.navigateNamedTo('/cityDetails?id=');
                        }
                      },
                    )
                    // FxButton(
                    //   borderRadius: 4,
                    //   onPressed: () {
                    //     _exportExcel();
                    //   },
                    //   text: 'Export',
                    // ),
                  ],
                ),
                FxBox.h16,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: CustomTextFieldEx(
                    controller: TextEditingController(),
                    hintText: 'Search',
                    onChanged: (value) {},
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SvgIcon(
                        icon: IconlyBroken.search,
                        color: AppConfigService.isDark
                            ? ColorConst.white
                            : ColorConst.black,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                FxBox.h16,
                ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxHeight: (56.0 * 10) + 72.0),
                    child: getTable)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _viewButton(value) {
    return Container(
      decoration: DecorationEx.getBorderDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () async {
              context.navigateNamedTo('/cityDetails?id=$value');
            },
            icon: Icon(Icons.edit),
          ),
          // IconButton(
          //   onPressed: () async {
          //     var result = await showGeneralDialog(
          //         transitionDuration: Duration(milliseconds: 200),
          //         barrierDismissible: true,
          //         barrierLabel: '',
          //         context: context,
          //         pageBuilder: (context, animation1, animation2) {
          //           return const SizedBox.shrink();
          //         },
          //         transitionBuilder: (context, a1, a2, widget) =>
          //             Transform.scale(
          //               scale: a1.value,
          //               child: Opacity(
          //                 opacity: a1.value,
          //                 child: Dialog(
          //                   insetAnimationCurve: Curves.bounceIn,
          //                   insetAnimationDuration: Duration(seconds: 1),
          //                   child: SupervisorDetailsPage(),
          //                 ),
          //               ),
          //             ));
          //   },
          //   icon: Icon(
          //     Icons.details,
          //     color: Colors.indigo,
          //   ),
          // ),
          IconButton(
            onPressed: () async {
              await controller.deleteCityHandler(value);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
