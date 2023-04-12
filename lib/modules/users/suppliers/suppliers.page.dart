import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

import 'suppliers.controller.dart';

class SuppliersPage extends MahgStatefulWidget<SuppliersController> {
  const SuppliersPage({SuppliersController? controllerEx, Key? key})
      : super(controllerEx, key: key);

  @override
  State<SuppliersPage> createState() => _SuppliersPageState();
}

class _SuppliersPageState
    extends MahgState<SuppliersPage, SuppliersController> {
  @override
  createController() {
    return SuppliersController();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('supplier page'),
    );
  }
}
