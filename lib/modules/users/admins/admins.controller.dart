import 'package:builtop_admin_dashboard/modules/users/admins/admin_details.page.dart';
import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class AdminsController extends MahgController {
  @override
  void init(Widget page) {}

  @override
  Future initLate(Widget page) async {
    if (page is AdminDetailsPage) {
      print('in admin details page');
    }
    return null;
  }
}
