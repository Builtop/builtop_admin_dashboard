import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/constants/images.dart';
import 'package:builtop_admin_dashboard/constants/text.dart';
import 'package:builtop_admin_dashboard/constants/theme.dart';
import 'package:builtop_admin_dashboard/widgets/datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class TransactionWidget extends StatefulWidget {
  const TransactionWidget({Key? key}) : super(key: key);

  @override
  State<TransactionWidget> createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
            ConstText.lightText(
              text: 'latestOrder',
              fontWeight: FontWeight.bold,
            ),
            FxBox.h10,
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: (56.0 * 10) + 72.0),
              child: DataTable3(
                showCheckboxColumn: false,
                showBottomBorder: true,
                columnSpacing: 20.0,
                minWidth: 728.0,
                dataRowHeight: 56.0,
                headingRowHeight: 64.0,
                border: TableBorder(
                  bottom: BorderSide(
                    width: 1,
                    color: isDark
                        ? ColorConst.white.withOpacity(0.25)
                        : Colors.grey.shade200,
                  ),
                  horizontalInside: BorderSide(
                    width: 1,
                    color: isDark
                        ? ColorConst.white.withOpacity(0.25)
                        : Colors.grey.shade50,
                  ),
                ),
                columns: [
                  DataColumn2(
                    label: _tableHeader('id'),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: _tableHeader('name'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: _tableHeader('product'),
                    size: ColumnSize.M,
                  ),
                  DataColumn2(
                    label: _tableHeader('orderDate'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: _tableHeader('amount'),
                    size: ColumnSize.M,
                  ),
                  DataColumn2(
                    label: _tableHeader('deliveryStatus'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: _tableHeader(''),
                    size: ColumnSize.S,
                  ),
                ],
                rows: [
                  DataRow(
                    onSelectChanged: (value) {},
                    cells: [
                      DataCell(_tableHeader('1')),
                      DataCell(_tableRowImage('Jane Deo')),
                      DataCell(_tableHeader('website')),
                      DataCell(_tableHeader('November 15, 2022')),
                      DataCell(_tableHeader('\$90')),
                      DataCell(_statusBox(ColorConst.successDark, 'Delivered')),
                      DataCell(_editButton()),
                    ],
                  ),
                  DataRow(
                    onSelectChanged: (value) {},
                    cells: [
                      DataCell(_tableHeader('2')),
                      DataCell(_tableRowImage('Joe Blow')),
                      DataCell(_tableHeader('mobileApp')),
                      DataCell(_tableHeader('November 17, 2022')),
                      DataCell(_tableHeader('\$127')),
                      DataCell(_statusBox(ColorConst.warningDark, 'Pending')),
                      DataCell(_editButton()),
                    ],
                  ),
                  DataRow(
                    onSelectChanged: (value) {},
                    cells: [
                      DataCell(_tableHeader('3')),
                      DataCell(_tableRowImage('Jhon Wick')),
                      DataCell(_tableHeader('website')),
                      DataCell(_tableHeader('November 3, 2022')),
                      DataCell(_tableHeader('\$107')),
                      DataCell(_statusBox(ColorConst.successDark, 'Delivered')),
                      DataCell(_editButton()),
                    ],
                  ),
                  DataRow(
                    onSelectChanged: (value) {},
                    cells: [
                      DataCell(_tableHeader('4')),
                      DataCell(_tableRowImage('Joe Wick')),
                      DataCell(_tableHeader('desktopApp')),
                      DataCell(_tableHeader('November 18, 2022')),
                      DataCell(_tableHeader('\$109')),
                      DataCell(_statusBox(ColorConst.errorDark, 'Cancel')),
                      DataCell(_editButton()),
                    ],
                  ),
                  DataRow(
                    onSelectChanged: (value) {},
                    cells: [
                      DataCell(_tableHeader('5')),
                      DataCell(_tableRowImage('Jane Blow')),
                      DataCell(_tableHeader('desktopApp')),
                      DataCell(_tableHeader('November 12, 2022')),
                      DataCell(_tableHeader('\$120')),
                      DataCell(_statusBox(ColorConst.successDark, 'Delivered')),
                      DataCell(_editButton()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tableHeader(String text) {
    return ConstText.lightText(
      text: text,
      fontWeight: FontWeight.w700,
    );
  }

  Widget _tableRowImage(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CircleAvatar(
          maxRadius: 15,
          backgroundImage: AssetImage(Images.profileImage),
        ),
        FxBox.w10,
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _statusBox(
    Color? color,
    String text,
  ) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
    // return FxBadge(
    //   text: text,
    //   color: color,
    //   radius: 5,
    //   textStyle: TextStyle(
    //     fontSize: MediaQuery.of(context).size.height * 0.011,
    //     color: ColorConst.white,
    //   ),
    // );
  }

  Widget _editButton() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.mode_edit_rounded),
    );
    // return FxButton(
    //   minWidth: 18,
    //   borderRadius: 6,
    //   color: ColorConst.primary,
    //   onPressed: () {},
    //   textColor: ColorConst.white,
    //   text: Strings.edit,
    // );
  }
}
