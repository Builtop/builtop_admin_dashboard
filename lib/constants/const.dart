import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:builtop_admin_dashboard/routes/app_routes.gr.dart' as gr;

TabsRouter? autoTabRouter;
TabsRouter? autoecTabRouter;
int routesLength = 0;

bool islg(context) =>
    MediaQuery.of(context).size.width >= 992 &&
    MediaQuery.of(context).size.width < 1300;

bool isxl(context) => MediaQuery.of(context).size.width >= 1300;
