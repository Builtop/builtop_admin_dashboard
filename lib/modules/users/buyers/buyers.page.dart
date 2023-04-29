import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/constants/decoration.dart';
import 'package:builtop_admin_dashboard/constants/icons.dart';
import 'package:builtop_admin_dashboard/constants/text.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:builtop_admin_dashboard/widgets/custom_sync_fusion_table.widget.dart';
import 'package:builtop_admin_dashboard/widgets/custom_text_field_ex.widget.dart';
import 'package:builtop_admin_dashboard/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'buyers.controller.dart';

import 'package:intl/intl.dart' as intl;

class BuyersPage extends MahgStatefulWidget<BuyersController> {
  const BuyersPage({BuyersController? controllerEx, Key? key})
      : super(controllerEx, key: key);

  @override
  State<BuyersPage> createState() => _BuyersPageState();
}

class _BuyersPageState extends MahgState<BuyersPage, BuyersController> {
  @override
  createController() {
    return BuyersController();
  }

  Widget get getTable => (controller.buyers == null)
      ? const CircularProgressIndicator.adaptive()
      : (controller.buyers?.isEmpty ?? false)
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
                "email": 'email',
                "status": 'status',
                "createdAt": 'createdAt',
                'actions': 'actions'
              },
              generalList: controller.buyers
                      ?.map((e) => {...e.toJson(), 'actions': e.id})
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
                      text: 'Buyers',
                      fontWeight: FontWeight.bold,
                    ),
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text("Export"),
                          value: 2,
                        )
                      ],
                      onSelected: (index) {},
                    )
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
              // context.navigateNamedTo('/pendingUsersDetails?id=$value');
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
              // UsersMenuButton(
              //   contextEx: context,
              //   returnToIndex: 1,
              //   user: Supervisor.fromJson({"_id": value}),
              // ).deleteUser().then(
              //     (value) => controller.getSupervisorsHandler(refresh: true));
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
