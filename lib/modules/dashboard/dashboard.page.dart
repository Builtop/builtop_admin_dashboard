// ignore_for_file: prefer_const_constructors

import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:builtop_admin_dashboard/routes/app_routes.gr.dart' as gr;

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  context.router.push(const gr.AdminsRoute());

                  // context.router.push(gr.LoginRoute());
                },
                child: Text(translate('body.dashboard')))
            // Listitem(),
            // FxBox.h24,
            // Monthlyearning(),
            // FxBox.h24,
            // Responsive.isWeb(context)
            //     ? Row(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Expanded(
            //             child: SalesReport(),
            //           ),
            //           FxBox.w24,
            //           Expanded(
            //             child: Salesanalytics(),
            //           ),
            //         ],
            //       )
            //     : Column(
            //         children: [
            //           SalesReport(),
            //           FxBox.h24,
            //           Salesanalytics(),
            //         ],
            //       ),
            // FxBox.h24,
            // Responsive.isWeb(context)
            //     ? Row(
            //         children: [
            //           Expanded(
            //             child: Chatscreen(),
            //           ),
            //           FxBox.w24,
            //           Expanded(
            //             child: Column(
            //               children: [
            //                 Row(
            //                   children: [
            //                     Expanded(child: StatusBox()),
            //                     FxBox.w24,
            //                     Expanded(child: TopProductSale()),
            //                   ],
            //                 ),
            //                 FxBox.h24,
            //                 Clienresponse(),
            //               ],
            //             ),
            //           ),
            //           FxBox.w24,
            //           Expanded(
            //             child: Activity(),
            //           ),
            //         ],
            //       )
            //     : Column(
            //         children: [
            //           Chatscreen(),
            //           FxBox.h24,
            //           Responsive.isTablet(context)
            //               ? Row(
            //                   children: [
            //                     Expanded(child: StatusBox()),
            //                     FxBox.w24,
            //                     Expanded(child: TopProductSale()),
            //                   ],
            //                 )
            //               : Column(
            //                   children: [
            //                     StatusBox(),
            //                     FxBox.h24,
            //                     TopProductSale(),
            //                   ],
            //                 ),
            //           FxBox.h24,
            //           Clienresponse(),
            //           FxBox.h24,
            //           Activity(),
            //         ],
            //       ),
            // FxBox.h24,
            // Transaction(),
          ],
        ),
      ],
    );
  }
}
