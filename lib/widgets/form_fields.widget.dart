import 'package:builtop_admin_dashboard/constants/text.dart';
import 'package:builtop_admin_dashboard/models/user.dart';
import 'package:builtop_admin_dashboard/modules/users/buyers/buyers.controller.dart';
import 'package:builtop_admin_dashboard/modules/users/pendings/pending_users.controller.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisors.controller.dart';
import 'package:builtop_admin_dashboard/modules/users/suppliers/supplier.model.dart';
import 'package:builtop_admin_dashboard/modules/users/suppliers/suppliers.controller.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:builtop_admin_dashboard/utils/responsive.dart';
import 'package:builtop_admin_dashboard/widgets/custom_text_field_ex.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:intl/intl.dart' as intl;
import 'package:mahg_essential_package/mahg_essential_package.dart';

class FormFieldsWidget extends StatelessWidget {
  final bool isUpdate;
  final dynamic controller;
  FormFieldsWidget(
      {required this.isUpdate, required this.controller, super.key});
  final List<String> _headingList = [
    'name',
    'email',
    'phone',
    'status',
    'createdAt',
    'password'
  ];
  final List<String> _hintList = [
    'your name',
    'test@test.com',
    '+91 9999999999',
    '',
    '',
    ''
  ];

  User get user => (controller is SupervisorsController)
      ? controller.supervisor
      : (controller is SuppliersController)
          ? controller.supplier
          : (controller is BuyersController)
              ? controller.buyer
              : (controller is PendingUsersController)
                  ? controller.pendingUser
                  : AppConfigService.user;

  Color get statusColor =>
      user.status == 'Active' ? Colors.green : Colors.orange;
  @override
  Widget build(BuildContext context) {
    return (Responsive.isWeb(context))
        ? Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _commonText(_headingList[0], context),
                        FxBox.h4,
                        _listBox(_hintList[0],
                            controller: controller.nameController,
                            validMsg: nameValidMsg),
                      ],
                    ),
                  ),
                  FxBox.w16,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _commonText(_headingList[1], context),
                        FxBox.h4,
                        _listBox(_hintList[1],
                            controller: controller.emailController,
                            validMsg: emailValidMsg),
                      ],
                    ),
                  ),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _commonText(_headingList[2], context),
                        FxBox.h4,
                        _listBox(_hintList[2],
                            controller: controller.phoneController,
                            validMsg: phoneValidMsg),
                      ],
                    ),
                  ),
                  FxBox.w16,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _commonText(_headingList[5], context),
                        FxBox.h4,
                        _listBox(_hintList[5]),
                      ],
                    ),
                  ),
                ],
              ),
              FxBox.h16,
              isUpdate
                  ? Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _commonText(_headingList[3], context),
                              FxBox.h4,
                              _listBox(user.status ?? '',
                                  isText: true, color: statusColor)
                            ],
                          ),
                        ),
                        FxBox.w16,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _commonText(_headingList[4], context),
                              FxBox.h4,
                              _listBox(
                                  intl.DateFormat('yyyy-MM-dd HH:mm a')
                                      .format(user.createdAt!),
                                  isText: true)
                            ],
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              FxBox.h16,
            ],
          )
        : (!Responsive.isWeb(context))
            ? Column(
                children: [
                  _textFieldNormal(_headingList, _hintList),
                  FxBox.h16,
                ],
              )
            : const SizedBox.shrink();
  }

  Widget _listBox(
    String hintText, {
    TextEditingController? controller,
    String? validMsg,
    bool isText = false,
    Color? color,
  }) {
    if (isText) {
      return ConstText.lightText(text: hintText, color: color);
    }
    return SizedBox(
      // height: 30,
      child: CustomTextFieldEx(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        obscureText: hintText == 'password' ? true : false,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        hintText: hintText,
        validator: controller != null
            ? (value) {
                if (value == null || value.isEmpty) {
                  return validMsg;
                }
                return null;
              }
            : null,
      ),
    );
  }

  Widget _commonText(String text, BuildContext context) {
    if (text == 'status' && !isUpdate) return const SizedBox.shrink();
    if (text == 'createdAt' && !isUpdate) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Responsive.isMobile(context) ? 8.0 : 0.0,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _textFieldNormal(List<String> headingList, List<String> hintList) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: headingList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (index == 3 && !isUpdate) return const SizedBox.shrink();
        if (index == 4 && !isUpdate) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: _responsive(
            _commonText(headingList[index], context),
            (index == 0)
                ? _listBox(hintList[index],
                    controller: controller.nameController,
                    validMsg: nameValidMsg)
                : (index == 1)
                    ? _listBox(hintList[index],
                        controller: controller.emailController,
                        validMsg: emailValidMsg)
                    : (index == 2)
                        ? _listBox(hintList[index],
                            controller: controller.phoneController,
                            validMsg: phoneValidMsg)
                        : (index == 3)
                            ? _listBox(user.status ?? '',
                                isText: true, color: statusColor)
                            : (index == 4)
                                ? _listBox(
                                    intl.DateFormat('yyyy-MM-dd HH:mm a')
                                        .format(user.createdAt!),
                                    isText: true)
                                : _listBox(
                                    hintList[index],
                                  ),
          ),
        );
      },
    );
  }

  String get emailValidMsg => "email is required";
  String get phoneValidMsg => "phone is required";
  String get nameValidMsg => "name is required";

  Widget _responsive(Widget childOne, Widget childTwo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [childOne, FxBox.h4, childTwo],
    );
  }
}
