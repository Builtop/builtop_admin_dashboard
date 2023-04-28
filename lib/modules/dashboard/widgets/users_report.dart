import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/constants/text.dart';
import 'package:builtop_admin_dashboard/main.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/dashboard.controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class UsersReport extends StatefulWidget {
  final DashboardController? dashboardController;
  const UsersReport({Key? key, required this.dashboardController})
      : super(key: key);

  @override
  State<UsersReport> createState() => _UsersReportState();
}

class _UsersReportState extends State<UsersReport> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: Container(
        constraints: const BoxConstraints(minHeight: 465),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ConstText.lightText(
              text: 'Users Report',
              fontWeight: FontWeight.bold,
            ),
            FxBox.h24,
            _dateAndPrice(),
            FxBox.h40,
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 240,
              child: PieChartSample2(
                dashboardController: widget.dashboardController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dateAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'November 01 - November 30',
          softWrap: true,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          '\$${2730}',
          softWrap: true,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class PieChartSample2 extends StatefulWidget {
  final DashboardController? dashboardController;

  const PieChartSample2({Key? key, required this.dashboardController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<PieChartSample2> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: PieChart(
            PieChartData(
                pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                }),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 80,
                sections: showingSections()),
          ),
        ),
      ],
    );
  }

  double get supervisorsPrecentage =>
      ((widget.dashboardController?.dashboardData?.supervisorsNum ?? 0) /
              (widget.dashboardController?.dashboardData?.usersNum ?? 0))
          .fixnum() *
      100;
  double get buyersPrecentage =>
      ((widget.dashboardController?.dashboardData?.buyersNum ?? 0) /
              (widget.dashboardController?.dashboardData?.usersNum ?? 0))
          .fixnum() *
      100;
  double get suppliersPrecentage =>
      ((widget.dashboardController?.dashboardData?.suppliersNum ?? 0) /
              (widget.dashboardController?.dashboardData?.usersNum ?? 0))
          .fixnum() *
      100;
  double get pendingUsersPrecentage =>
      ((widget.dashboardController?.dashboardData?.pendingUsersnNum ?? 0) /
              (widget.dashboardController?.dashboardData?.usersNum ?? 0))
          .fixnum() *
      100;

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 26.0 : 17.0;
      final radius = isTouched ? 61.0 : 51.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: supervisorsPrecentage,
            title: supervisorsPrecentage.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: pendingUsersPrecentage,
            title: pendingUsersPrecentage.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        case 2:
          return PieChartSectionData(
            color: ColorConst.primary,
            value: suppliersPrecentage,
            title: suppliersPrecentage.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        case 3:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: buyersPrecentage,
            title: buyersPrecentage.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }
}
