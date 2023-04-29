import 'package:builtop_admin_dashboard/constants/string.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/dashboard.page.dart';
import 'package:builtop_admin_dashboard/modules/requests/rfq/rfq.page.dart';
import 'package:builtop_admin_dashboard/modules/users/admins/admin_details.page.dart';
import 'package:builtop_admin_dashboard/modules/users/admins/admins.page.dart';
import 'package:builtop_admin_dashboard/modules/users/buyers/buyer_details.page.dart';
import 'package:builtop_admin_dashboard/modules/users/buyers/buyers.page.dart';
import 'package:builtop_admin_dashboard/modules/users/pendings/pending_users.page.dart';
import 'package:builtop_admin_dashboard/modules/users/pendings/pending_user_details.page.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisor_details.page.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisors.page.dart';
import 'package:builtop_admin_dashboard/modules/users/suppliers/supplier_details.page.dart';
import 'package:builtop_admin_dashboard/modules/users/suppliers/suppliers.page.dart';
import 'package:builtop_admin_dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';

int getRouteIndex(String route) {
  print('routeee ${route}');
  if (route == Strings.supervisors) {
    return 1;
  } else if (route == Strings.suppliers) {
    return 2;
  } else if (route == Strings.buyers) {
    return 3;
  } else if (route == Strings.pendingUsers) {
    return 4;
  } else if (route == Strings.supervisorDetails.capitalize()) {
    return 5;
  } else if (route == Strings.suppliersDetails.capitalize()) {
    return 6;
  } else if (route == Strings.buyerDetails.capitalize()) {
    return 7;
  } else if (route == Strings.pendingUsersDetails.capitalize()) {
    return 8;
  } else if (route == Strings.rfq) {
    return 9;
  } else {
    return 0;
  }
}

Widget getRouteWidget(int index) {
  // return DashboardPage();

  if (index == 1) {
    return SupervisorsPage();
  } else if (index == 2) {
    return SuppliersPage();
  } else if (index == 3) {
    return BuyersPage();
  } else if (index == 4) {
    return PendingUsersPage();
  } else if (index == 5) {
    return SupervisorDetailsPage();
  } else if (index == 6) {
    return SupplierDetailsPage();
  } else if (index == 7) {
    return BuyerDetailsPage();
  } else if (index == 8) {
    return PendingUsersDetailsPage();
  } else if (index == 9) {
    return RfqPage();
  } else {
    return DashboardPage();
  }
}
