import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/constants/const.dart';
import 'package:builtop_admin_dashboard/constants/text.dart';
import 'package:builtop_admin_dashboard/modules/users/admins/admins.page.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisors.controller.dart';
import 'package:builtop_admin_dashboard/utils/responsive.dart';
import 'package:builtop_admin_dashboard/widgets/users_menu_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';
import 'package:intl/intl.dart' as intl;

class SupervisorDetailsPage extends MahgStatefulWidget<SupervisorsController> {
  const SupervisorDetailsPage({SupervisorsController? controllerEx, Key? key})
      : super(controllerEx, key: key);

  @override
  State<SupervisorDetailsPage> createState() => _SupervisorDetailsPageState();
}

class _SupervisorDetailsPageState
    extends MahgState<SupervisorDetailsPage, SupervisorsController> {
  // if data sended from pop Not Get id from route ${context.routeData.queryParams} else if open page get data from query parameter
  @override
  createController() {
    return SupervisorsController();
  }

  final List<String> _headingList = [
    'email',
    'url',
    'telephone',
    'status',
    'createdAt'
  ];
  final List<String> _hintList = [
    'flutter@example.com',
    'https://flutter.com',
    '+91 9999999999',
    '',
    ''
  ];

  bool get loadingPage => ((context.routeData.queryParams.get('id') != null &&
          context.routeData.queryParams.get('id') != '') &&
      (controller.supervisor == null));
  bool get isUpdate => ((context.routeData.queryParams.get('id') != null &&
      context.routeData.queryParams.get('id') != ''));

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
                            controller.supervisor?.id ?? 'New Supervisor',
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                        isUpdate
                            ? UsersMenuButton(
                                contextEx: context,
                                returnToIndex: 1,
                                user: controller.supervisor!,
                              )
                            : const SizedBox.shrink()
                      ],
                    ),
                    FxBox.h24,
                    if (Responsive.isWeb(context))
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _commonText(_headingList[0]),
                                    FxBox.h4,
                                    _listBox(_hintList[0],
                                        controller: controller.emailController),
                                  ],
                                ),
                              ),
                              FxBox.w16,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _commonText(_headingList[1]),
                                    FxBox.h4,
                                    _listBox(_hintList[1]),
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
                                    _commonText(_headingList[2]),
                                    FxBox.h4,
                                    _listBox(_hintList[2]),
                                  ],
                                ),
                              ),
                              FxBox.w16,
                              Expanded(child: _passwordTextField()),
                            ],
                          ),
                          FxBox.h16,
                          isUpdate
                              ? Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _commonText(_headingList[3]),
                                          FxBox.h4,
                                          _listBox(
                                              controller.supervisor?.status ??
                                                  '',
                                              isText: true,
                                              color: statusColor)
                                        ],
                                      ),
                                    ),
                                    FxBox.w16,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _commonText(_headingList[4]),
                                          FxBox.h4,
                                          _listBox(
                                              intl.DateFormat(
                                                      'yyyy-MM-dd HH:mm a')
                                                  .format(controller
                                                      .supervisor!.createdAt!),
                                              isText: true)
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          FxBox.h16,
                        ],
                      ),
                    if (!Responsive.isWeb(context))
                      Column(
                        children: [
                          _textFieldNormal(_headingList, _hintList),
                          FxBox.h8,
                          _passwordTextField(),
                          FxBox.h16,
                        ],
                      ),
                    Row(
                      children: [
                        FxButton(
                          borderRadius: 4,
                          onPressed: controller.supervisor?.id == null
                              ? () => controller.addSupervisorHandler()
                              : () {},
                          text: controller.supervisor?.id == null
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

  Color get statusColor =>
      controller.supervisor?.status == 'Active' ? Colors.green : Colors.orange;

  Widget _responsive(Widget childOne, Widget childTwo) {
    // return Responsive.isMobile(context)
    //     ?
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [childOne, FxBox.h4, childTwo],
    );
    // : Row(
    //     children: [
    //       Expanded(
    //         flex: 2,
    //         child: childOne,
    //       ),
    //       Expanded(
    //         flex: 8,
    //         child: childTwo,
    //       ),
    //     ],
    //   );
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
            _commonText(
              headingList[index],
            ),
            (index == 0)
                ? _listBox(hintList[index],
                    controller: controller.emailController)
                : (index == 3)
                    ? _listBox(controller.supervisor?.status ?? '',
                        isText: true, color: statusColor)
                    : (index == 4)
                        ? _listBox(
                            intl.DateFormat('yyyy-MM-dd HH:mm a')
                                .format(controller.supervisor!.createdAt!),
                            isText: true)
                        : _listBox(
                            hintList[index],
                          ),
          ),
        );
      },
    );
  }

  Widget _listBox(
    String hintText, {
    TextEditingController? controller,
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
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        hintText: hintText,
        validator: controller != null
            ? (value) {
                if (value == null || value.isEmpty) {
                  return "email is required";
                }
                return null;
              }
            : null,
      ),
    );
  }

  Widget _passwordTextField() {
    return _responsive(_commonText('password'), _passWordBox());
  }

  Widget _passWordBox() {
    return SizedBox(
      height: 35,
      child: CustomTextFieldEx(
        obscureText: true,
        controller: controller.passwordController,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
      ),
    );
  }

  Widget _commonText(String text) {
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
}
