import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/const.dart';
import 'package:builtop_admin_dashboard/constants/numbers.dart';
import 'package:builtop_admin_dashboard/models/created_user.model.dart';
import 'package:builtop_admin_dashboard/models/lat_lng.model.dart';
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
  late TextEditingController latController;
  late TextEditingController lngController;

  @override
  void init(Widget page) {
    if (page is CityDetailsPage) {
      latController = TextEditingController();
      lngController = TextEditingController();

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

  Future<void> changeCityStatusHandler(String status) async {
    try {
      city?.status = status;
      var result = await LoadingOverlay.showFutureLoadingDialog(
          context: context,
          future: () => CityService.editCity(city?.toJson() ?? {}));

      if (result.result?.success ?? false) {
        CoolAlert.show(
                width: NumbersConst.dialogWidth,
                context: context,
                type: CoolAlertType.success,
                text: 'Status Changed Successfully')
            .then((value) => autoTabRouter?.setActiveIndex(12));
      } else {
        CoolAlert.show(
            width: NumbersConst.dialogWidth,
            context: context,
            type: CoolAlertType.error,
            text: result.result?.errorMessage);
      }
    } catch (e) {
      CoolAlert.show(
              width: NumbersConst.dialogWidth,
              context: context,
              type: CoolAlertType.error,
              text: e.toString())
          .then((value) => autoTabRouter?.setActiveIndex(12));
    }
  }

  void editCityHandler() async {
    if (formKey.currentState?.validate() ?? false) {
      city?.latlng ??= Latlng();

      if (latController.text != '') {
        city?.latlng?.lat = latController.text;
      }
      if (lngController.text != '') {
        city?.latlng?.lng = lngController.text;
      }

      try {
        var result = await LoadingOverlay.showFutureLoadingDialog(
            context: context,
            future: () => CityService.editCity(city?.toJson() ?? {}));

        if (result.result?.success ?? false) {
          CoolAlert.show(
                  width: NumbersConst.dialogWidth,
                  context: context,
                  type: CoolAlertType.success,
                  text: 'City Updated Successfully')
              .then((value) => autoTabRouter?.setActiveIndex(12));
        } else {
          CoolAlert.show(
              width: NumbersConst.dialogWidth,
              context: context,
              type: CoolAlertType.error,
              text: result.result?.errorMessage);
        }
      } catch (e) {
        CoolAlert.show(
                width: NumbersConst.dialogWidth,
                context: context,
                type: CoolAlertType.error,
                text: e.toString())
            .then((value) => autoTabRouter?.setActiveIndex(12));
      }
    }
  }

  void addNewCityHandler() async {
    if (formKey.currentState?.validate() ?? false) {
      city?.latlng ??= Latlng();
      city?.latlng?.lat = latController.text;
      city?.latlng?.lng = lngController.text;
      city?.status = 'Active';
      // todo remove created user
      city?.createdUser = CreatedUser.fromJson({
        "_id": "644e56ddc4ee8a159cd1d484",
        "email": 'test@mail.com',
        "phoneNum": "0233445664"
      });
      try {
        var result = await LoadingOverlay.showFutureLoadingDialog(
            context: context,
            future: () => CityService.addCity(
                city?.toJson() ?? {}, city?.country?.id ?? ''));

        if (result.result?.success ?? false) {
          CoolAlert.show(
                  width: NumbersConst.dialogWidth,
                  context: context,
                  type: CoolAlertType.success,
                  text: 'City Added Successfully')
              .then((value) => autoTabRouter?.setActiveIndex(12));
        } else {
          CoolAlert.show(
              width: NumbersConst.dialogWidth,
              context: context,
              type: CoolAlertType.error,
              text: result.result?.errorMessage);
        }
      } catch (e) {
        CoolAlert.show(
                width: NumbersConst.dialogWidth,
                context: context,
                type: CoolAlertType.error,
                text: e.toString())
            .then((value) => autoTabRouter?.setActiveIndex(12));
      }
    }
  }

  Future<void> getCityHandler() async {
    await Future.delayed(Duration(milliseconds: 400));
    if ((context.routeData.queryParams.get('id') == null) ||
        (context.routeData.queryParams.get('id') == '')) {
      city ??= City();
      return;
    }

    ProcessResult result =
        await CityService.getCityById(context.routeData.queryParams.get('id'));
    if (result.success) {
      try {
        city = City.fromJson(result.data);
        latController.text = city?.latlng?.lat ?? '';
        lngController.text = city?.latlng?.lng ?? '';
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

  Future<void> deleteCityHandler(String id, {bool returnHome = false}) async {
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
              .then((value) {
            if (returnHome) {
              autoTabRouter?.setActiveIndex(12);
            } else {
              getCitiesHandler(refresh: true);
            }
          });
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
