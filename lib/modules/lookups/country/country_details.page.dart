import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/constants/text.dart';
import 'package:builtop_admin_dashboard/modules/lookups/country/country.controller.dart';
import 'package:builtop_admin_dashboard/utils/responsive.dart';
import 'package:builtop_admin_dashboard/widgets/app_text_trans.dart';
import 'package:builtop_admin_dashboard/widgets/custom_text_field_ex.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';
import 'package:intl/intl.dart' as intl;

class CountryDetailsPage extends MahgStatefulWidget<CountryController> {
  const CountryDetailsPage({CountryController? controllerEx, Key? key})
      : super(controllerEx, key: key);

  @override
  State<CountryDetailsPage> createState() => _CityDetailsPageState();
}

class _CityDetailsPageState
    extends MahgState<CountryDetailsPage, CountryController> {
  @override
  createController() {
    return CountryController();
  }

  bool get loadingPage => ((context.routeData.queryParams.get('id') != null &&
          context.routeData.queryParams.get('id') != '') &&
      (controller.country == null));
  bool get isUpdate => ((context.routeData.queryParams.get('id') != null &&
      context.routeData.queryParams.get('id') != ''));
  Color get statusColor =>
      controller.country?.status == 'Active' ? Colors.green : Colors.red;

  bool get isActive => controller.country?.status == 'Active' ? true : false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: loadingPage
            ? const CircularProgressIndicator.adaptive()
            : Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            isUpdate ? 'Update Country' : 'New Country',
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                        isUpdate
                            ? PopupMenuButton(
                                itemBuilder: (context) => isActive
                                    ? [
                                        PopupMenuItem(
                                          child: Text(
                                            "InActive",
                                          ),
                                          value: 1,
                                        ),
                                        PopupMenuItem(
                                          child: Text(
                                            "Delete",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          value: 3,
                                        )
                                      ]
                                    : [
                                        PopupMenuItem(
                                          child: Text(
                                            "Active",
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                          value: 2,
                                        ),
                                        PopupMenuItem(
                                          child: Text(
                                            "Delete",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          value: 3,
                                        )
                                      ],
                                onSelected: (index) async {
                                  if (index == 1) {
                                    await controller
                                        .changeCountryStatusHandler('InActive');
                                  }
                                  if (index == 2) {
                                    await controller
                                        .changeCountryStatusHandler('Active');
                                  }

                                  if (index == 3) {
                                    await controller.deleteCountryHandler(
                                        controller.country?.id ?? "",
                                        returnHome: true);
                                  }
                                },
                              )
                            : const SizedBox.shrink()
                      ],
                    ),
                    FxBox.h24,
                    AppTextTrans(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // isRequired: true,
                      hintText: 'Name',
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      data: controller.country?.name ?? {},
                      onChangedEx: (value) {
                        controller.country?.name = value;
                      },
                      validateMessage: "You Must Write Name",
                      validator: (val) {
                        if (val!.isEmpty || val == '') {
                          return 'You Must Write Name';
                        }
                        return null;
                      },
                    ),
                    FxBox.h16,
                    locationWidget,
                    isUpdate
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxBox.h16,
                              statusTimeWidget,
                            ],
                          )
                        : const SizedBox.shrink(),
                    FxBox.h24,
                    Row(
                      children: [
                        FxButton(
                          borderRadius: 4,
                          onPressed: controller.country?.id == null
                              ? () => controller.addNewCountryHandler()
                              : () => controller.editCountryHandler(),
                          text: controller.country?.id == null
                              ? 'Add New'
                              : 'Update',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget get locationWidget {
    return (Responsive.isWeb(context))
        ? Row(
            children: [
              Expanded(child: latitudeWidget),
              FxBox.w16,
              Expanded(child: longtudeWidget),
            ],
          )
        : Column(
            children: [latitudeWidget, FxBox.h16, longtudeWidget],
          );
  }

  Widget get statusTimeWidget {
    return (Responsive.isWeb(context))
        ? Row(
            children: [
              Expanded(child: createdAtWidget),
              Expanded(child: statusWidget)
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [createdAtWidget, FxBox.h8, statusWidget],
          );
  }

  Widget get statusWidget => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstText.lightText(text: 'status'),
          FxBox.h4,
          ConstText.lightText(
              text: controller.country?.status ?? '', color: statusColor),
        ],
      );
  Widget get longtudeWidget => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Responsive.isMobile(context) ? 8.0 : 0.0,
            ),
            child: Text(
              'Longitude',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          FxBox.h4,
          CustomTextFieldEx(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.lngController,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            hintText: 'Longitude',
          ),
        ],
      );
  Widget get latitudeWidget => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Responsive.isMobile(context) ? 8.0 : 0.0,
            ),
            child: Text(
              'Latitude',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          FxBox.h4,
          CustomTextFieldEx(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.latController,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            hintText: 'Latitude',
          ),
        ],
      );
  Widget get createdAtWidget => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstText.lightText(text: 'createdAt'),
          FxBox.h4,
          ConstText.lightText(
              text: intl.DateFormat('yyyy-MM-dd HH:mm a')
                  .format(controller.country!.createdAt!)),
        ],
      );
}
