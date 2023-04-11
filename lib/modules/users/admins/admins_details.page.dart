import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/modules/login/login.page.dart';
import 'package:builtop_admin_dashboard/modules/users/admins/admins.page.dart';
import 'package:builtop_admin_dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterx/flutterx.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class AdminsDetailsPage extends StatefulWidget {
  const AdminsDetailsPage({@QueryParam('id') String? id, super.key});

  @override
  State<AdminsDetailsPage> createState() => _AdminsDetailsPageState();
}

class _AdminsDetailsPageState extends State<AdminsDetailsPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _dateNtimeController = TextEditingController();
  final List<String> _headingList = [
    'text',
    'formSearch',
    'email',
    'url',
    'telephone',
  ];
  final List<String> _hintList = [
    'Jone Doe',
    'Search...',
    'flutter@example.com',
    'https://flutter.com',
    '+91 9999999999',
  ];
  final List<String> _dropDownList = [
    'One',
    'Two',
    'Three',
    'Four',
  ];
  String _dropDownValue = 'One';
  @override
  void initState() {
    _passwordController.text = '1234567';
    _numberController.text = '30';
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _numberController.dispose();
    _dateNtimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        constraints: BoxConstraints(maxHeight: 700, maxWidth: 1000),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: WidgetScrollable(
            columnMainAxisAlignment: MainAxisAlignment.start,
            isColumn: true,
            widgets: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'inputElements',
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w600),
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
                                  _listBox(_hintList[0]),
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
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _commonText(_headingList[3]),
                                  FxBox.h4,
                                  _listBox(_hintList[3]),
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
                                  _commonText(_headingList[4]),
                                  FxBox.h4,
                                  _listBox(_hintList[4]),
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
            ],
          ),
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

  Widget _listBox(String hintText) {
    return SizedBox(
      height: 35,
      child: CustomTextFieldEx(
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
