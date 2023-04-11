import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/constants/const.dart';
import 'package:builtop_admin_dashboard/constants/decoration.dart';
import 'package:builtop_admin_dashboard/constants/icons.dart';
import 'package:builtop_admin_dashboard/constants/text.dart';
import 'package:builtop_admin_dashboard/constants/theme.dart';
import 'package:builtop_admin_dashboard/modules/login/login.page.dart';
import 'package:builtop_admin_dashboard/modules/users/admins/admins_details.page.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:builtop_admin_dashboard/utils/responsive.dart';
import 'package:builtop_admin_dashboard/widgets/custom_sync_fusion_table.widget.dart';
import 'package:builtop_admin_dashboard/widgets/datatable.dart';
import 'package:builtop_admin_dashboard/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_excel/excel.dart';
import 'package:flutterx/flutterx.dart';
import 'package:builtop_admin_dashboard/routes/app_routes.gr.dart' as gr;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AdminsPage extends StatefulWidget {
  const AdminsPage({Key? key}) : super(key: key);

  @override
  State<AdminsPage> createState() => _AdminsPageState();
}

class _AdminsPageState extends State<AdminsPage> {
  final TextEditingController _search = TextEditingController();

  List<Map<String, dynamic>> _searchList = [];

  List<int> ls = List<int>.generate(57, (index) => index + 1);
  int _dropValue = 10;
  int _page = 0;

  int _start = 0;
  int _end = 10;

  final List<Map<String, dynamic>> _venderList = [
    {
      'id': 1,
      'orderID': 'B4556VH',
      'Name': 'Bhavesh V.',
      'Email': 'Bhavesh.v@gmail.com',
      'phone': '+91 4545454567',
      'productName': 'Cap',
      'date': '11 Jan 2023',
      'amount': '20.00 \$',
    },
    {
      'id': 2,
      'orderID': 'B4556YG',
      'Name': 'Hemal M.',
      'Email': 'hemal.m@gmail.com',
      'phone': '+91 2323234567',
      'productName': 'Refrigerator',
      'date': '23 Nov 2022',
      'amount': '100.00 \$',
    },
    {
      'id': 3,
      'orderID': 'AC455VH',
      'Name': 'Mayur s.',
      'Email': 'ms@gmail.com',
      'phone': '+1 9191915676',
      'productName': 'Highliter T-shirt',
      'date': '12 Dec 2022',
      'amount': '30.00 \$',
    },
    {
      'id': 4,
      'orderID': 'CG455VH',
      'Name': 'Parth S.',
      'Email': 'parth.s@gmail.com',
      'phone': '+1 2343562345',
      'productName': 'Play Game',
      'date': '01 Apr 2022',
      'amount': '90.00 \$',
    },
    {
      'id': 5,
      'orderID': 'UN855VH',
      'Name': 'Keval G.',
      'Email': 'Keval.g@gmail.com',
      'phone': '+1 5675677759',
      'productName': 'Bag',
      'date': '31 Jan 2022',
      'amount': '45.00 \$',
    },
  ];

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
                      text: 'Order',
                      fontWeight: FontWeight.bold,
                    ),
                    FxButton(
                      borderRadius: 4,
                      onPressed: () {
                        _exportExcel();
                      },
                      text: 'Export',
                    ),
                  ],
                ),
                FxBox.h16,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: CustomTextFieldEx(
                    controller: _search,
                    hintText: 'Search',
                    onChanged: (value) {
                      _searchList = _venderList.where((element) {
                        return element['Email']
                                .toLowerCase()
                                .contains(_search.text.toLowerCase()) ||
                            element['Name']
                                .toLowerCase()
                                .contains(_search.text.toLowerCase());
                      }).toList();
                      setState(() {});
                    },
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
                    child: CustomSyncFusionTable(
                        key: UniqueKey(),
                        rowHeights: 70,
                        fieldToColumnName: {
                          "id": 'id',
                          "name": 'Name',
                          "age": 'Age',
                          "isActive": 'Active',
                        },
                        generalList: [
                          {
                            "id": '1',
                            "name": 'Ahmed',
                            "age": '22',
                            "isActive": true,
                          },
                          {
                            "id": '2',
                            "name": 'Nader',
                            "age": '33',
                            "isActive": false,
                          },
                          {
                            "id": '2',
                            "name": 'Nader',
                            "age": '33',
                            "isActive": false,
                          },
                          {
                            "id": '2',
                            "name": 'Nader',
                            "age": '33',
                            "isActive": false,
                          },
                          {
                            "id": '2',
                            "name": 'Nader',
                            "age": '33',
                            "isActive": false,
                          },
                          {
                            "id": '2',
                            "name": 'Nader',
                            "age": '33',
                            "isActive": false,
                          },
                        ],
                        buildCells: (row) {
                          return DataGridRowAdapter(
                              cells: row.getCells().map((e) {
                            return Container(
                                decoration: DecorationEx.getBorderDecoration(),
                                child: Center(child: Text(e.value.toString())));
                          }).toList());
                        },
                        context: context)

                    // DataTable3(
                    //   showCheckboxColumn: false,
                    //   showBottomBorder: true,
                    //   columnSpacing: 20.0,
                    //   minWidth: 728.0,
                    //   dataRowHeight: Responsive.isMobile(context)
                    //       ? 100
                    //       : Responsive.isTablet(context)
                    //           ? 95
                    //           : islg(context)
                    //               ? 90
                    //               : 56.0,
                    //   headingRowHeight: 64.0,
                    //   border: TableBorder(
                    //     bottom: BorderSide(
                    //       width: 1,
                    //       color: isDark
                    //           ? ColorConst.white.withOpacity(0.25)
                    //           : Colors.grey.shade200,
                    //     ),
                    //     horizontalInside: BorderSide(
                    //       width: 1,
                    //       color: isDark
                    //           ? ColorConst.white.withOpacity(0.25)
                    //           : Colors.grey.shade50,
                    //     ),
                    //   ),
                    //   columns: [
                    //     DataColumn2(
                    //       label: _tableHeader('id'),
                    //       size: ColumnSize.S,
                    //     ),
                    //     DataColumn2(
                    //       label: _tableHeader('orderID'),
                    //       size: ColumnSize.L,
                    //     ),
                    //     DataColumn2(
                    //       label: _tableHeader('customerName'),
                    //       size: ColumnSize.M,
                    //     ),
                    //     DataColumn2(
                    //       label: _tableHeader('emailAndMobile'),
                    //       size: ColumnSize.M,
                    //     ),
                    //     DataColumn2(
                    //       label: _tableHeader('productName'),
                    //       size: ColumnSize.M,
                    //     ),
                    //     DataColumn2(
                    //       label: _tableHeader('orderDate'),
                    //       size: ColumnSize.M,
                    //     ),
                    //     DataColumn2(
                    //       label: _tableHeader('orderAmount'),
                    //       size: ColumnSize.M,
                    //     ),
                    //     DataColumn2(
                    //       label: _tableHeader(''),
                    //       size: ColumnSize.S,
                    //     ),
                    //   ],
                    //   rows: _searchList.isEmpty
                    //       ? _venderList.map((e) {
                    //           return DataRow(
                    //             onSelectChanged: (value) {
                    //               // autoTabRouter!.setActiveIndex(51);
                    //             },
                    //             cells: [
                    //               DataCell(_tableHeader(e['id'].toString())),
                    //               DataCell(_tableHeader(e['orderID'])),
                    //               DataCell(_tableHeader(e['Name'])),
                    //               DataCell(_tableHeader(e['Email'])),
                    //               DataCell(_tableHeader(e['productName'])),
                    //               DataCell(_tableHeader(e['date'])),
                    //               DataCell(_tableHeader(e['amount'])),
                    //               DataCell(_viewButton(e)),
                    //             ],
                    //           );
                    //         }).toList()
                    //       : _searchList.map((e) {
                    //           return DataRow(
                    //             onSelectChanged: (value) {
                    //               // autoTabRouter!.setActiveIndex(51);
                    //             },
                    //             cells: [
                    //               DataCell(_tableHeader(e['id'].toString())),
                    //               DataCell(_tableHeader(e['orderID'])),
                    //               DataCell(_tableHeader(e['Name'])),
                    //               DataCell(_tableHeader(e['Email'])),
                    //               DataCell(_tableHeader(e['productName'])),
                    //               DataCell(_tableHeader(e['date'])),
                    //               DataCell(_tableHeader(e['amount'])),
                    //               DataCell(_viewButton(e)),
                    //             ],
                    //           );
                    //         }).toList(),
                    // ),

                    ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _tableHeader(String text) {
    return ConstText.lightText(
      text: text,
      fontWeight: FontWeight.w700,
    );
  }

  Widget _viewButton(Map<String, dynamic> e) {
    return FxButton(
      onPressed: () async {
        var result = await showGeneralDialog(
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
                      child: AdminsDetailsPage(id: 'lol'),
                    ),
                  ),
                ));
      },
      text: 'View',
      textColor: ColorConst.white,
      color: ColorConst.primary,
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
