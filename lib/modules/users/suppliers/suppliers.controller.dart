import 'package:builtop_admin_dashboard/constants/numbers.dart';
import 'package:builtop_admin_dashboard/modules/users/suppliers/supplier.model.dart';
import 'package:builtop_admin_dashboard/modules/users/suppliers/suppliers.page.dart';
import 'package:builtop_admin_dashboard/modules/users/suppliers/suppliers.service.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class SuppliersController extends MahgController {
  List<Supplier>? suppliers;
  Supplier? supplier;
  @override
  void init(Widget page) {}

  @override
  Future initLate(Widget page) async {
    if (page is SuppliersPage) {
      await getSupplierHandler();
    }
  }

  Future<void> getSupplierHandler({bool refresh = false}) async {
    ProcessResult result = await SuppliersService.getSuppliers();
    if (result.success) {
      try {
        suppliers =
            List<Supplier>.from(result.data.map((e) => Supplier.fromJson(e)))
                .toList();
      } catch (err, t) {
        print('ERROR $err');
        print('ERROR TRACE $t');
      }
    } else {
      suppliers = [];
      CoolAlert.show(
          width: NumbersConst.dialogWidth,
          context: context,
          type: CoolAlertType.error,
          text: result.errorMessage);
    }
    if (refresh) {
      setState();
    }
  }
}
