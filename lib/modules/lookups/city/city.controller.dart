import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/const.dart';
import 'package:builtop_admin_dashboard/constants/numbers.dart';
import 'package:builtop_admin_dashboard/modules/lookups/city/city.model.dart';
import 'package:builtop_admin_dashboard/modules/lookups/city/city.page.dart';
import 'package:builtop_admin_dashboard/modules/lookups/city/city.service.dart';
import 'package:builtop_admin_dashboard/modules/lookups/city/city_details.page.dart';
import 'package:builtop_admin_dashboard/services/admin_users.service.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class CityController extends MahgController {
  List<City>? cities;
  City? city;

  late GlobalKey<FormState> formKey;

  @override
  void init(Widget page) {
    if (page is CityDetailsPage) {
      formKey = GlobalKey<FormState>();
    }
  }

  @override
  Future initLate(Widget page) async {
    if (page is CityPage) {
      await getCitiesHandler();
    }
    if (page is CityDetailsPage) {
      await getCityHandler();
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

  Future<void> getCityHandler() async {
    await Future.delayed(Duration(milliseconds: 400));
    if ((context.routeData.queryParams.get('id') == null) ||
        (context.routeData.queryParams.get('id') == '')) return;

    ProcessResult result =
        await CityService.getCityById(context.routeData.queryParams.get('id'));
    if (result.success) {
      try {
        city = City.fromJson(result.data);
        // emailController.text = supervisor?.info?.email ?? '';
        // phoneController.text = supervisor?.phoneNum ?? '';
        // nameController.text = supervisor?.info?.name ?? '';
      } catch (err, t) {
        print('ERROR $err');
        print('ERROR TRACE $t');
      }
    } else {
      CoolAlert.show(
              width: NumbersConst.dialogWidth,
              context: context,
              type: CoolAlertType.error,
              text: result.errorMessage)
          .then((value) => autoTabRouter?.setActiveIndex(12));
    }
  }

  Future<void> deleteCityHandler(String id) async {
    try {
      bool? confirm;
      await CoolAlert.show(
          width: NumbersConst.dialogWidth,
          context: context,
          type: CoolAlertType.confirm,
          onConfirmBtnTap: () {
            confirm = true;
          },
          onCancelBtnTap: () {
            confirm = false;
          },
          title: 'Are you sure you want to delete ?');

      if (confirm ?? false) {
        if (!context.mounted) return;
        var result = await LoadingOverlay.showFutureLoadingDialog(
            context: context, future: () => CityService.deleteCity(id));

        if (result.result?.success ?? false) {
          if (!context.mounted) return;

          CoolAlert.show(
                  width: NumbersConst.dialogWidth,
                  context: context,
                  type: CoolAlertType.success,
                  text: 'City Deleted Successfully')
              .then((value) => getCitiesHandler(refresh: true));
        } else {
          if (!context.mounted) return;

          CoolAlert.show(
              width: NumbersConst.dialogWidth,
              context: context,
              type: CoolAlertType.error,
              text: result.result?.errorMessage);
        }
      }
    } catch (e) {
      CoolAlert.show(
          width: NumbersConst.dialogWidth,
          context: context,
          type: CoolAlertType.error,
          text: e.toString());
    }
  }
}
