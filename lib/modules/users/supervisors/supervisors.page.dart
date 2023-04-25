import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/constants/decoration.dart';
import 'package:builtop_admin_dashboard/constants/icons.dart';
import 'package:builtop_admin_dashboard/constants/text.dart';
import 'package:builtop_admin_dashboard/constants/theme.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisor_details.page.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:builtop_admin_dashboard/widgets/custom_sync_fusion_table.widget.dart';
import 'package:builtop_admin_dashboard/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_excel/excel.dart';
import 'package:flutterx/flutterx.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'supervisors.controller.dart';

class SupervisorsPage extends MahgStatefulWidget<SupervisorsController> {
  const SupervisorsPage({SupervisorsController? controllerEx, Key? key})
      : super(controllerEx, key: key);

  @override
  State<SupervisorsPage> createState() => _SupervisorsPageState();
}

class _SupervisorsPageState
    extends MahgState<SupervisorsPage, SupervisorsController> {
  @override
  createController() {
    return SupervisorsController();
  }

  Widget get getTable => (controller.supervisors == null ||
          (controller.supervisors?.isEmpty ?? false))
      ? const CircularProgressIndicator.adaptive()
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
          generalList: controller.supervisors
                  ?.map((e) => {...e.toJson(), 'actions': e.id})
                  .toList() ??
              [],
          buildCells: (row) {
            return DataGridRowAdapter(
                cells: row.getCells().map((e) {
              if (e.columnName == 'actions') {
                return _viewButton(e.value);
              }
              return Container(
                  decoration: DecorationEx.getBorderDecoration(),
                  child: Center(child: Text(e.value.toString())));
            }).toList());
          },
          context: context);

  final TextEditingController _search = TextEditingController();

  List<Map<String, dynamic>> _searchList = [];

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
                      text: 'Supervisors',
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
                            ])
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
                    controller: _search,
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
              print(value);
              context.navigateNamedTo('/supervisorDetails?id=$value');
            },
            icon: Icon(Icons.remove_red_eye_outlined),
          ),
          IconButton(
            onPressed: () async {
              var result = await showGeneralDialog(
                  transitionDuration: Duration(milliseconds: 200),
                  barrierDismissible: true,
                  barrierLabel: '',
                  context: context,
                  pageBuilder: (context, animation1, animation2) {
                    return const SizedBox.shrink();
                  },
                  transitionBuilder: (context, a1, a2, widget) =>
                      Transform.scale(
                        scale: a1.value,
                        child: Opacity(
                          opacity: a1.value,
                          child: Dialog(
                            insetAnimationCurve: Curves.bounceIn,
                            insetAnimationDuration: Duration(seconds: 1),
                            child: SupervisorDetailsPage(),
                          ),
                        ),
                      ));
            },
            icon: Icon(
              Icons.details,
              color: Colors.indigo,
            ),
          ),
          IconButton(
            onPressed: () async {},
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _exportExcel() async {
    List<String> titleList = [
      '#',
      'First Name',
      'Last Name',
      'User Name',
    ];
    var excel = Excel.createExcel();
    excel.sheets['Sheet1']!.insertRowIterables(titleList, 0);

    for (var i = 0; i < 50; i++) {
      final List<String> list = ['${i + 1}', 'Jane', 'Deo', '@flutter'];
      excel.sheets['Sheet1']!.insertRowIterables(list, i + 1);
    }

    excel.save(fileName: 'FlutterAdmin.xlsx');
  }
}

class CustomTextFieldEx extends StatelessWidget {
  final TextEditingController? controller;
  final InputBorder? border;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isDense;
  final Widget? prefixIcon;
  final TextStyle? prefixStyle;
  final bool readOnly;
  final void Function()? onTap;
  final InputBorder? errorBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? disabledBorder;
  final int? maxLines;
  final String? prefixText;
  final TextStyle? style;
  final int? maxLength;
  final AutovalidateMode? autovalidateMode;
  final Color? fillColor;
  final bool? filled;
  const CustomTextFieldEx({
    Key? key,
    this.controller,
    this.border,
    this.hintText,
    this.contentPadding,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.isDense,
    this.prefixIcon,
    this.prefixStyle,
    this.readOnly = false,
    this.onTap,
    this.enabledBorder,
    this.errorBorder,
    this.disabledBorder,
    this.focusedBorder,
    this.maxLines = 1,
    this.prefixText,
    this.style,
    this.maxLength,
    this.autovalidateMode,
    this.fillColor,
    this.filled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      maxLength: maxLength,
      style: style,
      onTap: onTap,
      readOnly: readOnly,
      keyboardType: keyboardType,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: filled,
        prefixText: prefixText,
        errorBorder: errorBorder,
        enabledBorder: enabledBorder?.copyWith(
          borderSide: BorderSide(
            color:
                !isDark ? ColorConst.dark : ColorConst.white.withOpacity(0.5),
          ),
        ),
        focusedBorder: focusedBorder?.copyWith(
          borderSide: BorderSide(
            color:
                !isDark ? ColorConst.dark : ColorConst.white.withOpacity(0.5),
          ),
        ),
        disabledBorder: disabledBorder,
        prefixIcon: prefixIcon,
        isDense: isDense,
        border: border,
        hintText: hintText,
        contentPadding: contentPadding,
        suffixIcon: suffixIcon,
        prefixStyle: prefixStyle,
      ),
    );
  }
}
