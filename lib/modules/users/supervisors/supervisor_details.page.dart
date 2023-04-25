import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/modules/users/admins/admins.page.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisors.controller.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:builtop_admin_dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

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

  final TextEditingController _passwordController = TextEditingController();

  final List<String> _headingList = [
    'email',
    'url',
    'telephone',
  ];
  final List<String> _hintList = [
    'flutter@example.com',
    'https://flutter.com',
    '+91 9999999999',
  ];

  @override
  void initState() {
    _passwordController.text = '1234567';
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.supervisor?.id ?? '',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
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
              )
          ],
        ),
      ),
    );
  }

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
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: _responsive(
            _commonText(
              headingList[index],
            ),
            _listBox(
              hintList[index],
            ),
          ),
        );
      },
    );
  }

  Widget _listBox(String hintText, {TextEditingController? controller}) {
    return SizedBox(
      height: 35,
      child: CustomTextFieldEx(
        controller: controller,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        hintText: hintText,
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
        controller: _passwordController,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
      ),
    );
  }

  Widget _commonText(String text) {
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
