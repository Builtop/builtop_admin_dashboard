import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/constants/text.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/dashboard.controller.dart';
import 'package:builtop_admin_dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class ListitemWidget extends StatefulWidget {
  final DashboardController? dashboardController;
  const ListitemWidget({required this.dashboardController, super.key});

  @override
  State<ListitemWidget> createState() => _ListitemWidgetState();
}

class _ListitemWidgetState extends State<ListitemWidget> {
  late List<Map<String, dynamic>>? _listItem;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    _listItem = [
      {
        'id': 0,
        'producTitle': 'Supervisors',
        'value': widget.dashboardController?.dashboardData?.supervisorsNum
            .toString(),
        'boxIcon': Icons.note_add,
        // 'boxColor': '05A660',
        'boxColor': ['FEBE99', 'F66F94'],
        'percentage': 60,
      },
      {
        'id': 1,
        'producTitle': 'Suppliers',
        'value':
            widget.dashboardController?.dashboardData?.suppliersNum.toString(),
        'boxIcon': Icons.note_alt_rounded,
        // 'boxColor': '9B5B1E',
        'boxColor': ['43D5E7', '7DB1F0'],
        'percentage': 10,
      },
      {
        'id': 2,
        'producTitle': 'Buyers',
        'value':
            widget.dashboardController?.dashboardData?.buyersNum.toString(),
        'boxIcon': Icons.pending_actions_outlined,
        // 'boxColor': '18818D',
        'boxColor': ['8DDAD3', '3CC2AE'],
        'percentage': -5,
      },
      {
        'id': 3,
        'producTitle': 'Pending Users',
        'value': widget.dashboardController?.dashboardData?.pendingUsersnNum
            .toString(),
        'boxIcon': Icons.shopping_bag_rounded,
        // 'boxColor': '004FC4',
        'boxColor': ['A100DA', '400370'],
        'percentage': 15,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        gridDelegate: Responsive.isMobile(context)
            ? const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 205,
              )
            : MediaQuery.of(context).size.width < 1500
                ? const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 205,
                  )
                : SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent:
                        MediaQuery.of(context).size.width * 0.24,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 205,
                  ),
        itemCount: _listItem?.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _listContainer(
            boxIcon: _listItem?[index]['boxIcon'],
            productTitle: _listItem?[index]['producTitle'],
            value: _listItem?[index]['value'] ?? '0',
            percentage: _listItem?[index]['percentage'],
            color: index == 3
                ? [
                    Color(int.parse('0xff${_listItem?[index]['boxColor'][0]}'))
                        .withOpacity(0.75),
                    Color(int.parse('0xff${_listItem?[index]['boxColor'][1]}'))
                        .withOpacity(0.75)
                  ]
                : [
                    Color(int.parse('0xff${_listItem?[index]['boxColor'][0]}')),
                    Color(int.parse('0xff${_listItem?[index]['boxColor'][1]}'))
                  ],
          );
        },
      ),
    );
  }

  Widget _listContainer({
    required IconData boxIcon,
    required String productTitle,
    required String value,
    required List<Color> color,
    required int percentage,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              // color: color.withOpacity(0.25),
              borderRadius: BorderRadius.circular(18.0),
              gradient: LinearGradient(colors: color),
              // boxShadow: [
              //   BoxShadow(
              //     color: color.withOpacity(0.5),
              //     blurRadius: 5.0,
              //     offset: const Offset(0.0, 5.0),
              //   ),
              // ],
            ),
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ConstText.lightText(
                      text: productTitle,
                      color: ColorConst.white,
                      fontWeight: FontWeight.bold,
                    ),
                    Icon(boxIcon, color: ColorConst.white),
                  ],
                ),
                FxBox.h12,
                ConstText.mediumText(
                  text: value,
                  color: ColorConst.white,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                ConstText.lightText(
                  text: percentage > 0
                      ? 'increasedBy ${percentage.abs()}%'
                      : 'decreasedBy ${percentage.abs()}%',
                  color: ColorConst.white,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Positioned(
            right: -75.0,
            top: -25.0,
            child: Container(
              height: 175,
              width: 175,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConst.white.withOpacity(0.15),
              ),
            ),
          ),
          Positioned(
            bottom: -87.5,
            right: -37.5,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConst.white.withOpacity(0.15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
