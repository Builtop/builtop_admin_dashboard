import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

import 'country.controller.dart';

class CountryPage extends MahgStatefulWidget<CountryController> {
  const CountryPage({CountryController? controllerEx, Key? key})
      : super(controllerEx, key: key);

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends MahgState<CountryPage, CountryController> {
  @override
  createController() {
    return CountryController();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
