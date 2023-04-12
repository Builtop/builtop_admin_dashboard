import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

import 'rfq.controller.dart';

class RfqPage extends MahgStatefulWidget<RfqController> {
  const RfqPage({RfqController? controllerEx, Key? key})
      : super(controllerEx, key: key);

  @override
  State<RfqPage> createState() => _RfqPageState();
}

class _RfqPageState extends MahgState<RfqPage, RfqController> {
  @override
  createController() {
    return RfqController();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
