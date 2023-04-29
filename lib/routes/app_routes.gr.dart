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
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../modules/dashboard/dashboard.controller.dart' as _i15;
import '../modules/dashboard/dashboard.page.dart' as _i3;
import '../modules/login/login.page.dart' as _i1;
import '../modules/requests/rfq/rfq.controller.dart' as _i20;
import '../modules/requests/rfq/rfq.page.dart' as _i12;
import '../modules/users/buyers/buyer_details.page.dart' as _i11;
import '../modules/users/buyers/buyers.controller.dart' as _i19;
import '../modules/users/buyers/buyers.page.dart' as _i10;
import '../modules/users/pendings/pending_user_details.page.dart' as _i7;
import '../modules/users/pendings/pending_users.controller.dart' as _i17;
import '../modules/users/pendings/pending_users.page.dart' as _i6;
import '../modules/users/supervisors/supervisor_details.page.dart' as _i5;
import '../modules/users/supervisors/supervisors.controller.dart' as _i16;
import '../modules/users/supervisors/supervisors.page.dart' as _i4;
import '../modules/users/suppliers/supplier_details.page.dart' as _i9;
import '../modules/users/suppliers/suppliers.controller.dart' as _i18;
import '../modules/users/suppliers/suppliers.page.dart' as _i8;
import '../widgets/menu_bar_page.dart' as _i2;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    MenuBarRoute.name: (routeData) {
      final args = routeData.argsAs<MenuBarRouteArgs>(
          orElse: () => const MenuBarRouteArgs());
      return _i13.MaterialPageX<dynamic>(
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
      return _i13.MaterialPageX<dynamic>(
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
      return _i13.MaterialPageX<dynamic>(
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
      return _i13.MaterialPageX<dynamic>(
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
      return _i13.MaterialPageX<dynamic>(
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
      return _i13.MaterialPageX<dynamic>(
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
      return _i13.MaterialPageX<dynamic>(
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
      return _i13.MaterialPageX<dynamic>(
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
      return _i13.MaterialPageX<dynamic>(
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
      return _i13.MaterialPageX<dynamic>(
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
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.RfqPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(
          LoginRoute.name,
          path: 'login',
        ),
        _i13.RouteConfig(
          MenuBarRoute.name,
          path: '/',
          children: [
            _i13.RouteConfig(
              '#redirect',
              path: '',
              parent: MenuBarRoute.name,
              redirectTo: 'dashboard',
              fullMatch: true,
            ),
            _i13.RouteConfig(
              DashboardRoute.name,
              path: 'dashboard',
              parent: MenuBarRoute.name,
            ),
            _i13.RouteConfig(
              SupervisorsRoute.name,
              path: 'supervisors',
              parent: MenuBarRoute.name,
            ),
            _i13.RouteConfig(
              SupervisorDetailsRoute.name,
              path: 'supervisorDetails',
              parent: MenuBarRoute.name,
            ),
            _i13.RouteConfig(
              PendingUsersRoute.name,
              path: 'pending-users',
              parent: MenuBarRoute.name,
            ),
            _i13.RouteConfig(
              PendingUsersDetailsRoute.name,
              path: 'pendingUsersDetails',
              parent: MenuBarRoute.name,
            ),
            _i13.RouteConfig(
              SuppliersRoute.name,
              path: 'suppliers',
              parent: MenuBarRoute.name,
            ),
            _i13.RouteConfig(
              SupplierDetailsRoute.name,
              path: 'supplierDetails',
              parent: MenuBarRoute.name,
            ),
            _i13.RouteConfig(
              BuyersRoute.name,
              path: 'buyers',
              parent: MenuBarRoute.name,
            ),
            _i13.RouteConfig(
              BuyerDetailsRoute.name,
              path: 'buyerDetails',
              parent: MenuBarRoute.name,
            ),
            _i13.RouteConfig(
              RfqRoute.name,
              path: 'rfq',
              parent: MenuBarRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.MenuBarPage]
class MenuBarRoute extends _i13.PageRouteInfo<MenuBarRouteArgs> {
  MenuBarRoute({
    _i14.Key? key,
    _i14.Widget Function()? body,
    List<_i13.PageRouteInfo>? children,
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

  final _i14.Key? key;

  final _i14.Widget Function()? body;

  @override
  String toString() {
    return 'MenuBarRouteArgs{key: $key, body: $body}';
  }
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i13.PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    _i15.DashboardController? controllerEx,
    _i14.Key? key,
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

  final _i15.DashboardController? controllerEx;

  final _i14.Key? key;

  @override
  String toString() {
    return 'DashboardRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i4.SupervisorsPage]
class SupervisorsRoute extends _i13.PageRouteInfo<SupervisorsRouteArgs> {
  SupervisorsRoute({
    _i16.SupervisorsController? controllerEx,
    _i14.Key? key,
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

  final _i16.SupervisorsController? controllerEx;

  final _i14.Key? key;

  @override
  String toString() {
    return 'SupervisorsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i5.SupervisorDetailsPage]
class SupervisorDetailsRoute
    extends _i13.PageRouteInfo<SupervisorDetailsRouteArgs> {
  SupervisorDetailsRoute({
    _i16.SupervisorsController? controllerEx,
    _i14.Key? key,
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

  final _i16.SupervisorsController? controllerEx;

  final _i14.Key? key;

  @override
  String toString() {
    return 'SupervisorDetailsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i6.PendingUsersPage]
class PendingUsersRoute extends _i13.PageRouteInfo<PendingUsersRouteArgs> {
  PendingUsersRoute({
    _i17.PendingUsersController? controllerEx,
    _i14.Key? key,
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

  final _i17.PendingUsersController? controllerEx;

  final _i14.Key? key;

  @override
  String toString() {
    return 'PendingUsersRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i7.PendingUsersDetailsPage]
class PendingUsersDetailsRoute
    extends _i13.PageRouteInfo<PendingUsersDetailsRouteArgs> {
  PendingUsersDetailsRoute({
    _i17.PendingUsersController? controllerEx,
    _i14.Key? key,
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

  final _i17.PendingUsersController? controllerEx;

  final _i14.Key? key;

  @override
  String toString() {
    return 'PendingUsersDetailsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i8.SuppliersPage]
class SuppliersRoute extends _i13.PageRouteInfo<SuppliersRouteArgs> {
  SuppliersRoute({
    _i18.SuppliersController? controllerEx,
    _i14.Key? key,
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

  final _i18.SuppliersController? controllerEx;

  final _i14.Key? key;

  @override
  String toString() {
    return 'SuppliersRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i9.SupplierDetailsPage]
class SupplierDetailsRoute
    extends _i13.PageRouteInfo<SupplierDetailsRouteArgs> {
  SupplierDetailsRoute({
    _i18.SuppliersController? controllerEx,
    _i14.Key? key,
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

  final _i18.SuppliersController? controllerEx;

  final _i14.Key? key;

  @override
  String toString() {
    return 'SupplierDetailsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i10.BuyersPage]
class BuyersRoute extends _i13.PageRouteInfo<BuyersRouteArgs> {
  BuyersRoute({
    _i19.BuyersController? controllerEx,
    _i14.Key? key,
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

  final _i19.BuyersController? controllerEx;

  final _i14.Key? key;

  @override
  String toString() {
    return 'BuyersRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i11.BuyerDetailsPage]
class BuyerDetailsRoute extends _i13.PageRouteInfo<BuyerDetailsRouteArgs> {
  BuyerDetailsRoute({
    _i19.BuyersController? controllerEx,
    _i14.Key? key,
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

  final _i19.BuyersController? controllerEx;

  final _i14.Key? key;

  @override
  String toString() {
    return 'BuyerDetailsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i12.RfqPage]
class RfqRoute extends _i13.PageRouteInfo<RfqRouteArgs> {
  RfqRoute({
    _i20.RfqController? controllerEx,
    _i14.Key? key,
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

  final _i20.RfqController? controllerEx;

  final _i14.Key? key;

  @override
  String toString() {
    return 'RfqRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}
