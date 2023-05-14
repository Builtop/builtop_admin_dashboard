import 'package:builtop_admin_dashboard/constants/numbers.dart';
import 'package:builtop_admin_dashboard/modules/lookups/city/city.model.dart';
import 'package:builtop_admin_dashboard/modules/lookups/city/city.page.dart';
import 'package:builtop_admin_dashboard/modules/lookups/city/city.service.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class CityController extends MahgController {
  List<City>? cities;
  City? city;

  late GlobalKey<FormState> formKey;

  @override
  void init(Widget page) {}

  @override
  Future initLate(Widget page) async {
    if (page is CityPage) {
      await getCitiesHandler();
    }
  }

  Future<void> getCitiesHandler({bool refresh = false}) async {
    ProcessResult result = await CityService.getCities();
    if (result.success) {
      try {
        cities =
            List<City>.from(result.data.map((e) => City.fromJson(e))).toList();
      } catch (err, t) {
        print('ERROR $err');
        print('ERROR TRACE $t');
      }
    } else {
      cities = [];
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
