// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;

import '../modules/dashboard/dashboard.controller.dart' as _i17;
import '../modules/dashboard/dashboard.page.dart' as _i3;
import '../modules/login/login.controller.dart' as _i16;
import '../modules/login/login.page.dart' as _i1;
import '../modules/requests/rfq/rfq.controller.dart' as _i22;
import '../modules/requests/rfq/rfq.page.dart' as _i12;
import '../modules/users/admin/admin_details.page.dart' as _i13;
import '../modules/users/admin/admins.controller.dart' as _i23;
import '../modules/users/buyers/buyer_details.page.dart' as _i11;
import '../modules/users/buyers/buyers.controller.dart' as _i21;
import '../modules/users/buyers/buyers.page.dart' as _i10;
import '../modules/users/pendings/pending_user_details.page.dart' as _i7;
import '../modules/users/pendings/pending_users.controller.dart' as _i19;
import '../modules/users/pendings/pending_users.page.dart' as _i6;
import '../modules/users/supervisors/supervisor_details.page.dart' as _i5;
import '../modules/users/supervisors/supervisors.controller.dart' as _i18;
import '../modules/users/supervisors/supervisors.page.dart' as _i4;
import '../modules/users/suppliers/supplier_details.page.dart' as _i9;
import '../modules/users/suppliers/suppliers.controller.dart' as _i20;
import '../modules/users/suppliers/suppliers.page.dart' as _i8;
import '../widgets/menu_bar_page.dart' as _i2;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.LoginPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    MenuBarRoute.name: (routeData) {
      final args = routeData.argsAs<MenuBarRouteArgs>(
          orElse: () => const MenuBarRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.MenuBarPage(
          key: args.key,
          body: args.body,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardRouteArgs>(
          orElse: () => const DashboardRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.DashboardPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    SupervisorsRoute.name: (routeData) {
      final args = routeData.argsAs<SupervisorsRouteArgs>(
          orElse: () => const SupervisorsRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.SupervisorsPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    SupervisorDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SupervisorDetailsRouteArgs>(
          orElse: () => const SupervisorDetailsRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.SupervisorDetailsPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    PendingUsersRoute.name: (routeData) {
      final args = routeData.argsAs<PendingUsersRouteArgs>(
          orElse: () => const PendingUsersRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.PendingUsersPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    PendingUsersDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PendingUsersDetailsRouteArgs>(
          orElse: () => const PendingUsersDetailsRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.PendingUsersDetailsPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    SuppliersRoute.name: (routeData) {
      final args = routeData.argsAs<SuppliersRouteArgs>(
          orElse: () => const SuppliersRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.SuppliersPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    SupplierDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SupplierDetailsRouteArgs>(
          orElse: () => const SupplierDetailsRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.SupplierDetailsPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    BuyersRoute.name: (routeData) {
      final args = routeData.argsAs<BuyersRouteArgs>(
          orElse: () => const BuyersRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.BuyersPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    BuyerDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BuyerDetailsRouteArgs>(
          orElse: () => const BuyerDetailsRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.BuyerDetailsPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    RfqRoute.name: (routeData) {
      final args =
          routeData.argsAs<RfqRouteArgs>(orElse: () => const RfqRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.RfqPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    AdminDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AdminDetailsRouteArgs>(
          orElse: () => const AdminDetailsRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.AdminDetailsPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(
          LoginRoute.name,
          path: 'login',
        ),
        _i14.RouteConfig(
          MenuBarRoute.name,
          path: '/',
          children: [
            _i14.RouteConfig(
              '#redirect',
              path: '',
              parent: MenuBarRoute.name,
              redirectTo: 'dashboard',
              fullMatch: true,
            ),
            _i14.RouteConfig(
              DashboardRoute.name,
              path: 'dashboard',
              parent: MenuBarRoute.name,
            ),
            _i14.RouteConfig(
              SupervisorsRoute.name,
              path: 'supervisors',
              parent: MenuBarRoute.name,
            ),
            _i14.RouteConfig(
              SupervisorDetailsRoute.name,
              path: 'supervisorDetails',
              parent: MenuBarRoute.name,
            ),
            _i14.RouteConfig(
              PendingUsersRoute.name,
              path: 'pending-users',
              parent: MenuBarRoute.name,
            ),
            _i14.RouteConfig(
              PendingUsersDetailsRoute.name,
              path: 'pendingUsersDetails',
              parent: MenuBarRoute.name,
            ),
            _i14.RouteConfig(
              SuppliersRoute.name,
              path: 'suppliers',
              parent: MenuBarRoute.name,
            ),
            _i14.RouteConfig(
              SupplierDetailsRoute.name,
              path: 'supplierDetails',
              parent: MenuBarRoute.name,
            ),
            _i14.RouteConfig(
              BuyersRoute.name,
              path: 'buyers',
              parent: MenuBarRoute.name,
            ),
            _i14.RouteConfig(
              BuyerDetailsRoute.name,
              path: 'buyerDetails',
              parent: MenuBarRoute.name,
            ),
            _i14.RouteConfig(
              RfqRoute.name,
              path: 'rfq',
              parent: MenuBarRoute.name,
            ),
            _i14.RouteConfig(
              AdminDetailsRoute.name,
              path: 'adminDetails',
              parent: MenuBarRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i14.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i16.LoginController? controllerEx,
    _i15.Key? key,
  }) : super(
          LoginRoute.name,
          path: 'login',
          args: LoginRouteArgs(
            controllerEx: controllerEx,
            key: key,
          ),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.controllerEx,
    this.key,
  });

  final _i16.LoginController? controllerEx;

  final _i15.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i2.MenuBarPage]
class MenuBarRoute extends _i14.PageRouteInfo<MenuBarRouteArgs> {
  MenuBarRoute({
    _i15.Key? key,
    _i15.Widget Function()? body,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          MenuBarRoute.name,
          path: '/',
          args: MenuBarRouteArgs(
            key: key,
            body: body,
          ),
          initialChildren: children,
        );

  static const String name = 'MenuBarRoute';
}

class MenuBarRouteArgs {
  const MenuBarRouteArgs({
    this.key,
    this.body,
  });

  final _i15.Key? key;

  final _i15.Widget Function()? body;

  @override
  String toString() {
    return 'MenuBarRouteArgs{key: $key, body: $body}';
  }
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i14.PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    _i17.DashboardController? controllerEx,
    _i15.Key? key,
  }) : super(
          DashboardRoute.name,
          path: 'dashboard',
          args: DashboardRouteArgs(
            controllerEx: controllerEx,
            key: key,
          ),
        );

  static const String name = 'DashboardRoute';
}

class DashboardRouteArgs {
  const DashboardRouteArgs({
    this.controllerEx,
    this.key,
  });

  final _i17.DashboardController? controllerEx;

  final _i15.Key? key;

  @override
  String toString() {
    return 'DashboardRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i4.SupervisorsPage]
class SupervisorsRoute extends _i14.PageRouteInfo<SupervisorsRouteArgs> {
  SupervisorsRoute({
    _i18.SupervisorsController? controllerEx,
    _i15.Key? key,
  }) : super(
          SupervisorsRoute.name,
          path: 'supervisors',
          args: SupervisorsRouteArgs(
            controllerEx: controllerEx,
            key: key,
          ),
        );

  static const String name = 'SupervisorsRoute';
}

class SupervisorsRouteArgs {
  const SupervisorsRouteArgs({
    this.controllerEx,
    this.key,
  });

  final _i18.SupervisorsController? controllerEx;

  final _i15.Key? key;

  @override
  String toString() {
    return 'SupervisorsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i5.SupervisorDetailsPage]
class SupervisorDetailsRoute
    extends _i14.PageRouteInfo<SupervisorDetailsRouteArgs> {
  SupervisorDetailsRoute({
    _i18.SupervisorsController? controllerEx,
    _i15.Key? key,
  }) : super(
          SupervisorDetailsRoute.name,
          path: 'supervisorDetails',
          args: SupervisorDetailsRouteArgs(
            controllerEx: controllerEx,
            key: key,
          ),
        );

  static const String name = 'SupervisorDetailsRoute';
}

class SupervisorDetailsRouteArgs {
  const SupervisorDetailsRouteArgs({
    this.controllerEx,
    this.key,
  });

  final _i18.SupervisorsController? controllerEx;

  final _i15.Key? key;

  @override
  String toString() {
    return 'SupervisorDetailsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i6.PendingUsersPage]
class PendingUsersRoute extends _i14.PageRouteInfo<PendingUsersRouteArgs> {
  PendingUsersRoute({
    _i19.PendingUsersController? controllerEx,
    _i15.Key? key,
  }) : super(
          PendingUsersRoute.name,
          path: 'pending-users',
          args: PendingUsersRouteArgs(
            controllerEx: controllerEx,
            key: key,
          ),
        );

  static const String name = 'PendingUsersRoute';
}

class PendingUsersRouteArgs {
  const PendingUsersRouteArgs({
    this.controllerEx,
    this.key,
  });

  final _i19.PendingUsersController? controllerEx;

  final _i15.Key? key;

  @override
  String toString() {
    return 'PendingUsersRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i7.PendingUsersDetailsPage]
class PendingUsersDetailsRoute
    extends _i14.PageRouteInfo<PendingUsersDetailsRouteArgs> {
  PendingUsersDetailsRoute({
    _i19.PendingUsersController? controllerEx,
    _i15.Key? key,
  }) : super(
          PendingUsersDetailsRoute.name,
          path: 'pendingUsersDetails',
          args: PendingUsersDetailsRouteArgs(
            controllerEx: controllerEx,
            key: key,
          ),
        );

  static const String name = 'PendingUsersDetailsRoute';
}

class PendingUsersDetailsRouteArgs {
  const PendingUsersDetailsRouteArgs({
    this.controllerEx,
    this.key,
  });

  final _i19.PendingUsersController? controllerEx;

  final _i15.Key? key;

  @override
  String toString() {
    return 'PendingUsersDetailsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i8.SuppliersPage]
class SuppliersRoute extends _i14.PageRouteInfo<SuppliersRouteArgs> {
  SuppliersRoute({
    _i20.SuppliersController? controllerEx,
    _i15.Key? key,
  }) : super(
          SuppliersRoute.name,
          path: 'suppliers',
          args: SuppliersRouteArgs(
            controllerEx: controllerEx,
            key: key,
          ),
        );

  static const String name = 'SuppliersRoute';
}

class SuppliersRouteArgs {
  const SuppliersRouteArgs({
    this.controllerEx,
    this.key,
  });

  final _i20.SuppliersController? controllerEx;

  final _i15.Key? key;

  @override
  String toString() {
    return 'SuppliersRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i9.SupplierDetailsPage]
class SupplierDetailsRoute
    extends _i14.PageRouteInfo<SupplierDetailsRouteArgs> {
  SupplierDetailsRoute({
    _i20.SuppliersController? controllerEx,
    _i15.Key? key,
  }) : super(
          SupplierDetailsRoute.name,
          path: 'supplierDetails',
          args: SupplierDetailsRouteArgs(
            controllerEx: controllerEx,
            key: key,
          ),
        );

  static const String name = 'SupplierDetailsRoute';
}

class SupplierDetailsRouteArgs {
  const SupplierDetailsRouteArgs({
    this.controllerEx,
    this.key,
  });

  final _i20.SuppliersController? controllerEx;

  final _i15.Key? key;

  @override
  String toString() {
    return 'SupplierDetailsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i10.BuyersPage]
class BuyersRoute extends _i14.PageRouteInfo<BuyersRouteArgs> {
  BuyersRoute({
    _i21.BuyersController? controllerEx,
    _i15.Key? key,
  }) : super(
          BuyersRoute.name,
          path: 'buyers',
          args: BuyersRouteArgs(
            controllerEx: controllerEx,
            key: key,
          ),
        );

  static const String name = 'BuyersRoute';
}

class BuyersRouteArgs {
  const BuyersRouteArgs({
    this.controllerEx,
    this.key,
  });

  final _i21.BuyersController? controllerEx;

  final _i15.Key? key;

  @override
  String toString() {
    return 'BuyersRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i11.BuyerDetailsPage]
class BuyerDetailsRoute extends _i14.PageRouteInfo<BuyerDetailsRouteArgs> {
  BuyerDetailsRoute({
    _i21.BuyersController? controllerEx,
    _i15.Key? key,
  }) : super(
          BuyerDetailsRoute.name,
          path: 'buyerDetails',
          args: BuyerDetailsRouteArgs(
            controllerEx: controllerEx,
            key: key,
          ),
        );

  static const String name = 'BuyerDetailsRoute';
}

class BuyerDetailsRouteArgs {
  const BuyerDetailsRouteArgs({
    this.controllerEx,
    this.key,
  });

  final _i21.BuyersController? controllerEx;

  final _i15.Key? key;

  @override
  String toString() {
    return 'BuyerDetailsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i12.RfqPage]
class RfqRoute extends _i14.PageRouteInfo<RfqRouteArgs> {
  RfqRoute({
    _i22.RfqController? controllerEx,
    _i15.Key? key,
  }) : super(
          RfqRoute.name,
          path: 'rfq',
          args: RfqRouteArgs(
            controllerEx: controllerEx,
            key: key,
          ),
        );

  static const String name = 'RfqRoute';
}

class RfqRouteArgs {
  const RfqRouteArgs({
    this.controllerEx,
    this.key,
  });

  final _i22.RfqController? controllerEx;

  final _i15.Key? key;

  @override
  String toString() {
    return 'RfqRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i13.AdminDetailsPage]
class AdminDetailsRoute extends _i14.PageRouteInfo<AdminDetailsRouteArgs> {
  AdminDetailsRoute({
    _i23.AdminsController? controllerEx,
    _i15.Key? key,
  }) : super(
          AdminDetailsRoute.name,
          path: 'adminDetails',
          args: AdminDetailsRouteArgs(
            controllerEx: controllerEx,
            key: key,
          ),
        );

  static const String name = 'AdminDetailsRoute';
}

class AdminDetailsRouteArgs {
  const AdminDetailsRouteArgs({
    this.controllerEx,
    this.key,
  });

  final _i23.AdminsController? controllerEx;

  final _i15.Key? key;

  @override
  String toString() {
    return 'AdminDetailsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}
