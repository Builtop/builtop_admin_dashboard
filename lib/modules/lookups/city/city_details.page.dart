import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/constants/text.dart';
import 'package:builtop_admin_dashboard/modules/lookups/city/city.controller.dart';
import 'package:builtop_admin_dashboard/modules/lookups/country/widgets/country_drop_down.widget.dart';
import 'package:builtop_admin_dashboard/utils/responsive.dart';
import 'package:builtop_admin_dashboard/widgets/app_text_trans.dart';
import 'package:builtop_admin_dashboard/widgets/custom_text_field_ex.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';
import 'package:intl/intl.dart' as intl;

class CityDetailsPage extends MahgStatefulWidget<CityController> {
  const CityDetailsPage({CityController? controllerEx, Key? key})
      : super(controllerEx, key: key);

  @override
  State<CityDetailsPage> createState() => _CityDetailsPageState();
}

class _CityDetailsPageState extends MahgState<CityDetailsPage, CityController> {
  @override
  createController() {
    return CityController();
  }

  bool get loadingPage => ((context.routeData.queryParams.get('id') != null &&
          context.routeData.queryParams.get('id') != '') &&
      (controller.city == null));
  bool get isUpdate => ((context.routeData.queryParams.get('id') != null &&
      context.routeData.queryParams.get('id') != ''));
  Color get statusColor =>
      controller.city?.status == 'Active' ? Colors.green : Colors.red;

  bool get isActive => controller.city?.status == 'Active' ? true : false;

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
                            isUpdate ? 'Update City' : 'New City',
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
                                        .changeCityStatusHandler('InActive');
                                  }
                                  if (index == 2) {
                                    await controller
                                        .changeCityStatusHandler('Active');
                                  }

                                  if (index == 3) {
                                    await controller.deleteCityHandler(
                                        controller.city?.id ?? "",
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
                      data: controller.city?.name ?? {},
                      onChangedEx: (value) {
                        controller.city?.name = value;
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
                    CountryDropDown(
                        key: UniqueKey(),
                        selectedValue: controller.city?.country?.name,
                        (country) {
                      controller.city?.country = country;
                    }),
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
                          onPressed: controller.city?.id == null
                              ? () => controller.addNewCityHandler()
                              : () => controller.editCityHandler(),
                          text: controller.city?.id == null
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
              Expanded(child: LatitudeWidget),
              FxBox.w16,
              Expanded(child: longtudeWidget),
            ],
          )
        : Column(
            children: [LatitudeWidget, FxBox.h16, longtudeWidget],
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
              text: controller.city?.status ?? '', color: statusColor),
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
  Widget get LatitudeWidget => Column(
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
                  .format(controller.city!.createdAt!)),
        ],
      );
}
