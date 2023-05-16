import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/const.dart';
import 'package:builtop_admin_dashboard/constants/numbers.dart';
import 'package:builtop_admin_dashboard/models/created_user.model.dart';
import 'package:builtop_admin_dashboard/models/lat_lng.model.dart';
import 'package:builtop_admin_dashboard/modules/lookups/country/country.model.dart';
import 'package:builtop_admin_dashboard/modules/lookups/country/country.page.dart';
import 'package:builtop_admin_dashboard/modules/lookups/country/country.service.dart';
import 'package:builtop_admin_dashboard/modules/lookups/country/country_details.page.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class CountryController extends MahgController {
  List<Country>? countries;
  Country? country;

  late GlobalKey<FormState> formKey;
  late TextEditingController latController;
  late TextEditingController lngController;

  @override
  void init(Widget page) {
    if (page is CountryDetailsPage) {
      latController = TextEditingController();
      lngController = TextEditingController();

      formKey = GlobalKey<FormState>();
    }
  }

  @override
  Future initLate(Widget page) async {
    if (page is CountryPage) {
      await getCountriesHandler();
    }
    if (page is CountryDetailsPage) {
      await getCountryHandler();
    }
  }

  Future<void> getCountriesHandler({bool refresh = false}) async {
    ProcessResult result = await CountryService.getCountries();
    if (result.success) {
      try {
        countries =
            List<Country>.from(result.data.map((e) => Country.fromJson(e)))
                .toList();
      } catch (err, t) {
        print('ERROR $err');
        print('ERROR TRACE $t');
      }
    } else {
      countries = [];
      if (!context.mounted) return;

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

  Future<void> changeCountryStatusHandler(String status) async {
    try {
      country?.status = status;
      var result = await LoadingOverlay.showFutureLoadingDialog(
          context: context,
          future: () => CountryService.editCountry(country?.toJson() ?? {}));

      if (result.result?.success ?? false) {
        if (!context.mounted) return;

        CoolAlert.show(
                width: NumbersConst.dialogWidth,
                context: context,
                type: CoolAlertType.success,
                text: 'Status Changed Successfully')
            .then((value) => autoTabRouter?.setActiveIndex(11));
      } else {
        if (!context.mounted) return;

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
          .then((value) => autoTabRouter?.setActiveIndex(11));
    }
  }

  void editCountryHandler() async {
    if (formKey.currentState?.validate() ?? false) {
      country?.latlng ??= Latlng();

      if (latController.text != '') {
        country?.latlng?.lat = latController.text;
      }
      if (lngController.text != '') {
        country?.latlng?.lng = lngController.text;
      }

      try {
        var result = await LoadingOverlay.showFutureLoadingDialog(
            context: context,
            future: () => CountryService.editCountry(country?.toJson() ?? {}));

        if (result.result?.success ?? false) {
          if (!context.mounted) return;

          CoolAlert.show(
                  width: NumbersConst.dialogWidth,
                  context: context,
                  type: CoolAlertType.success,
                  text: 'Country Updated Successfully')
              .then((value) => autoTabRouter?.setActiveIndex(11));
        } else {
          if (!context.mounted) return;

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
            .then((value) => autoTabRouter?.setActiveIndex(11));
      }
    }
  }

  void addNewCountryHandler() async {
    if (formKey.currentState?.validate() ?? false) {
      country?.latlng ??= Latlng();
      country?.latlng?.lat = latController.text;
      country?.latlng?.lng = lngController.text;
      country?.status = 'Active';
      country?.image = 'ppp.png';
      // todo remove created user
      country?.createdUser = CreatedUser.fromJson({
        "_id": "644e56ddc4ee8a159cd1d484",
        "email": 'test@mail.com',
        "phoneNum": "0233445664"
      });
      try {
        var result = await LoadingOverlay.showFutureLoadingDialog(
            context: context,
            future: () => CountryService.addCountry(country?.toJson() ?? {}));

        if (result.result?.success ?? false) {
          if (!context.mounted) return;

          CoolAlert.show(
                  width: NumbersConst.dialogWidth,
                  context: context,
                  type: CoolAlertType.success,
                  text: 'Country Added Successfully')
              .then((value) => autoTabRouter?.setActiveIndex(11));
        } else {
          if (!context.mounted) return;

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
            .then((value) => autoTabRouter?.setActiveIndex(11));
      }
    }
  }

  Future<void> getCountryHandler() async {
    await Future.delayed(Duration(milliseconds: 400));

    if ((context.routeData.queryParams.get('id') == null) ||
        (context.routeData.queryParams.get('id') == '')) {
      country ??= Country();
      return;
    }

    ProcessResult result = await CountryService.getCountryById(
        context.routeData.queryParams.get('id'));
    if (result.success) {
      try {
        country = Country.fromJson(result.data);
        latController.text = country?.latlng?.lat ?? '';
        lngController.text = country?.latlng?.lng ?? '';
        // nameController.text = supervisor?.info?.name ?? '';
      } catch (err, t) {
        print('ERROR $err');
        print('ERROR TRACE $t');
      }
    } else {
      if (!context.mounted) return;

      CoolAlert.show(
              width: NumbersConst.dialogWidth,
              context: context,
              type: CoolAlertType.error,
              text: result.errorMessage)
          .then((value) => autoTabRouter?.setActiveIndex(11));
    }
  }

  Future<void> deleteCountryHandler(String id,
      {bool returnHome = false}) async {
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
            context: context, future: () => CountryService.deleteCountry(id));

        if (result.result?.success ?? false) {
          if (!context.mounted) return;

          CoolAlert.show(
                  width: NumbersConst.dialogWidth,
                  context: context,
                  type: CoolAlertType.success,
                  text: 'Country Deleted Successfully')
              .then((value) {
            if (returnHome) {
              autoTabRouter?.setActiveIndex(11);
            } else {
              getCountriesHandler(refresh: true);
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
