import 'package:builtop_admin_dashboard/constants/numbers.dart';
import 'package:builtop_admin_dashboard/modules/users/buyers/buyer.model.dart';
import 'package:builtop_admin_dashboard/modules/users/buyers/buyers.page.dart';
import 'package:builtop_admin_dashboard/modules/users/buyers/buyers.service.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class BuyersController extends MahgController {
  List<Buyer>? buyers;
  Buyer? buyer;
  @override
  void init(Widget page) {}

  @override
  Future initLate(Widget page) async {
    if (page is BuyersPage) {
      await getBuyersHandler();
    }
  }

  Future<void> getBuyersHandler() async {
    ProcessResult result = await BuyersService.getBuyers();
    if (result.success) {
      try {
        buyers = List<Buyer>.from(result.data.map((e) => Buyer.fromJson(e)))
            .toList();
      } catch (err, t) {
        print('ERROR $err');
        print('ERROR TRACE $t');
      }
    } else {
      buyers = [];
      CoolAlert.show(
          width: NumbersConst.dialogWidth,
          context: context,
          type: CoolAlertType.error,
          text: result.errorMessage);
    }
  }
}
