import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/constants/decoration.dart';
import 'package:builtop_admin_dashboard/constants/text.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';

class CustomSyncFusionTable extends StatefulWidget {
  final Map<String, dynamic> fieldToColumnName;
  final List<dynamic> generalList;
  final DataGridRowAdapter? Function(DataGridRow row) buildCells;
  final double? rowHeights;
  final bool isLazy;
  final BuildContext context;
  final Future<List<dynamic>> Function(int startIndex)? onLazyLoad;

  /// Map column id to preferred width (optional),all unmentioned fields will divide the remaining space equally.
  final Map<String, double>? columnsWithOptionalWidth;
  final double? maxTableWidth;

  const CustomSyncFusionTable(
      {Key? key,
      required this.fieldToColumnName,
      required this.generalList,
      required this.buildCells,
      required this.context,
      this.onLazyLoad,
      this.columnsWithOptionalWidth,
      this.maxTableWidth,
      this.isLazy = false,
      this.rowHeights})
      : super(key: key);

  @override
  State<CustomSyncFusionTable> createState() => _CustomSyncFusionTableState();
}

class _CustomSyncFusionTableState extends State<CustomSyncFusionTable> {
  late GeneralDataSource generalDataSource;

  @override
  void initState() {
    super.initState();
    generalDataSource = GeneralDataSource(
      isLazy: widget.isLazy,
      buildCells: widget.buildCells,
      headerNameMappedToFields: widget.fieldToColumnName,
      generalList: widget.generalList,
      context: widget.context,
      onLazyLoad: widget.onLazyLoad,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: widget.maxTableWidth ?? double.infinity,
      ),
      child: Column(
        children: [
          Expanded(
            child: SfDataGridTheme(
                data: SfDataGridThemeData(
                    brightness: AppConfigService.isDark
                        ? Brightness.light
                        : Brightness.dark),
                child: SfDataGrid(
                    headerGridLinesVisibility: GridLinesVisibility.none,
                    gridLinesVisibility: GridLinesVisibility.none,
                    shrinkWrapRows: false,
                    columnWidthMode: ColumnWidthMode.fill,
                    selectionMode: SelectionMode.single,
                    rowHeight: widget.rowHeights ?? 50,
                    source: generalDataSource,
                    columns: widget.fieldToColumnName.entries
                        .map((entry) => GridColumn(
                            width: (widget.columnsWithOptionalWidth?.keys
                                        .contains(entry.key) ??
                                    false)
                                ? (widget
                                        .columnsWithOptionalWidth?[entry.key] ??
                                    double.nan)
                                : double.nan,
                            columnName: entry.key,
                            label: Container(
                                decoration: DecorationEx.getBorderDecoration(),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                alignment: Alignment.center,
                                child: _tableHeader(entry.value))))
                        .toList())),
          ),
          SizedBox(
            height: 60,
            child: SfDataPager(
              firstPageItemVisible: widget.isLazy ? false : true,
              lastPageItemVisible: widget.isLazy ? false : true,
              pageCount: (widget.generalList.length / 15).ceil().toDouble() +
                  (generalDataSource.hasMore ? 1 : 0),
              direction: Axis.horizontal,
              visibleItemsCount: 3,
              onPageNavigationStart: (int pageIndex) {
                setState(() {});
              },
              delegate: generalDataSource,
              onPageNavigationEnd: (int pageIndex) {
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _tableHeader(String text) {
    return ConstText.lightText(
      text: text,
      fontWeight: FontWeight.w700,
    );
  }
}

class GeneralDataSource extends DataGridSource {
  final BuildContext context;
  final Future<List<dynamic>> Function(int startIndex)? onLazyLoad;
  final DataGridRowAdapter? Function(DataGridRow row) buildCells;
  final int rowsPerPage = 15;
  final Map<String, dynamic> headerNameMappedToFields;
  final bool isLazy;

  GeneralDataSource(
      {required this.headerNameMappedToFields,
      this.generalList,
      required this.buildCells,
      required this.context,
      this.onLazyLoad,
      this.isLazy = false}) {
    generalListEx = generalList
            ?.map((singleItem) => DataGridRow(cells: [
                  ...headerNameMappedToFields.entries.map((entry) =>
                      DataGridCell(
                          columnName: entry.key, value: singleItem[entry.key]))
                ]))
            .toList() ??
        [];

    if (generalListEx.length < rowsPerPage || !isLazy) {
      hasMore = false;
    }
  }

  bool hasMore = true;

  List<dynamic>? generalList;
  late List<DataGridRow> generalListEx;

  List<DataGridRow> _tableDataGridRows = [];

  @override
  List<DataGridRow> get rows => _tableDataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return buildCells(row);
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * rowsPerPage;
    int endIndex = startIndex + rowsPerPage;
    if (endIndex > generalListEx.length &&
        isLazy &&
        startIndex == generalListEx.length) {
      // set Loading Here
      // AppNavigator.showLoading(context);
      var result = await onLazyLoad?.call(startIndex);
      // await creditController.onGetCredit(skip: startIndex);

      var newIncomingList = result ?? [];
      // var newIncomingList = (onLazyLoadList!)
      //     .map((e) => {
      //           'product': e!.product!.toJson(),
      //           'price': '',
      //           'bfp': e.quantity.toString(),
      //           'assign': e.quantityAssigned.toString(),
      //           'remain':
      //               ((e.quantity ?? 0) - (e.quantityAssigned ?? 0)).toString(),
      //           'actions': 'Assign to vehicle'
      //         })
      //     .toList();
      if (newIncomingList.length < rowsPerPage) {
        hasMore = false;
      }
      generalList?.addAll(newIncomingList);

      generalListEx = generalList
              ?.map((singleItem) => DataGridRow(cells: [
                    ...headerNameMappedToFields.entries.map((entry) =>
                        DataGridCell(
                            columnName: entry.key,
                            value: singleItem[entry.key]))
                  ]))
              .toList() ??
          [];
    }
    if (startIndex < generalListEx.length) {
      if (endIndex > generalListEx.length) {
        endIndex = generalListEx.length;
      }
      _tableDataGridRows =
          generalListEx.getRange(startIndex, endIndex).toList(growable: false);
    } else {
      _tableDataGridRows = [];
    }
    notifyListeners();
    return true;
  }
}
