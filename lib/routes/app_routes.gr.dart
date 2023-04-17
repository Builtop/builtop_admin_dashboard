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
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../modules/dashboard/dashboard.controller.dart' as _i10;
import '../modules/dashboard/dashboard.page.dart' as _i3;
import '../modules/login/login.page.dart' as _i1;
import '../modules/requests/rfq/rfq.controller.dart' as _i13;
import '../modules/requests/rfq/rfq.page.dart' as _i7;
import '../modules/users/admins/admin_details.page.dart' as _i4;
import '../modules/users/admins/admins.controller.dart' as _i11;
import '../modules/users/admins/admins.page.dart' as _i5;
import '../modules/users/suppliers/suppliers.controller.dart' as _i12;
import '../modules/users/suppliers/suppliers.page.dart' as _i6;
import '../widgets/menu_bar_page.dart' as _i2;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    MenuBarRoute.name: (routeData) {
      final args = routeData.argsAs<MenuBarRouteArgs>(
          orElse: () => const MenuBarRouteArgs());
      return _i8.MaterialPageX<dynamic>(
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
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.DashboardPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    AdminDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AdminDetailsRouteArgs>(
          orElse: () => const AdminDetailsRouteArgs());
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.AdminDetailsPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    AdminsRoute.name: (routeData) {
      final args = routeData.argsAs<AdminsRouteArgs>(
          orElse: () => const AdminsRouteArgs());
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.AdminsPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    SuppliersRoute.name: (routeData) {
      final args = routeData.argsAs<SuppliersRouteArgs>(
          orElse: () => const SuppliersRouteArgs());
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.SuppliersPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    RfqRoute.name: (routeData) {
      final args =
          routeData.argsAs<RfqRouteArgs>(orElse: () => const RfqRouteArgs());
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.RfqPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          LoginRoute.name,
          path: 'login',
        ),
        _i8.RouteConfig(
          MenuBarRoute.name,
          path: '/',
          children: [
            _i8.RouteConfig(
              '#redirect',
              path: '',
              parent: MenuBarRoute.name,
              redirectTo: 'dashboard',
              fullMatch: true,
            ),
            _i8.RouteConfig(
              DashboardRoute.name,
              path: 'dashboard',
              parent: MenuBarRoute.name,
            ),
            _i8.RouteConfig(
              AdminDetailsRoute.name,
              path: 'adminDetails',
              parent: MenuBarRoute.name,
            ),
            _i8.RouteConfig(
              AdminsRoute.name,
              path: 'admins',
              parent: MenuBarRoute.name,
            ),
            _i8.RouteConfig(
              SuppliersRoute.name,
              path: 'suppliers',
              parent: MenuBarRoute.name,
            ),
            _i8.RouteConfig(
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
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.MenuBarPage]
class MenuBarRoute extends _i8.PageRouteInfo<MenuBarRouteArgs> {
  MenuBarRoute({
    _i9.Key? key,
    _i9.Widget Function()? body,
    List<_i8.PageRouteInfo>? children,
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

  final _i9.Key? key;

  final _i9.Widget Function()? body;

  @override
  String toString() {
    return 'MenuBarRouteArgs{key: $key, body: $body}';
  }
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i8.PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    _i10.DashboardController? controllerEx,
    _i9.Key? key,
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

  final _i10.DashboardController? controllerEx;

  final _i9.Key? key;

  @override
  String toString() {
    return 'DashboardRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i4.AdminDetailsPage]
class AdminDetailsRoute extends _i8.PageRouteInfo<AdminDetailsRouteArgs> {
  AdminDetailsRoute({
    _i11.AdminsController? controllerEx,
    _i9.Key? key,
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

  final _i11.AdminsController? controllerEx;

  final _i9.Key? key;

  @override
  String toString() {
    return 'AdminDetailsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i5.AdminsPage]
class AdminsRoute extends _i8.PageRouteInfo<AdminsRouteArgs> {
  AdminsRoute({
    _i11.AdminsController? controllerEx,
    _i9.Key? key,
  }) : super(
          AdminsRoute.name,
          path: 'admins',
          args: AdminsRouteArgs(
            controllerEx: controllerEx,
            key: key,
          ),
        );

  static const String name = 'AdminsRoute';
}

class AdminsRouteArgs {
  const AdminsRouteArgs({
    this.controllerEx,
    this.key,
  });

  final _i11.AdminsController? controllerEx;

  final _i9.Key? key;

  @override
  String toString() {
    return 'AdminsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i6.SuppliersPage]
class SuppliersRoute extends _i8.PageRouteInfo<SuppliersRouteArgs> {
  SuppliersRoute({
    _i12.SuppliersController? controllerEx,
    _i9.Key? key,
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

  final _i12.SuppliersController? controllerEx;

  final _i9.Key? key;

  @override
  String toString() {
    return 'SuppliersRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i7.RfqPage]
class RfqRoute extends _i8.PageRouteInfo<RfqRouteArgs> {
  RfqRoute({
    _i13.RfqController? controllerEx,
    _i9.Key? key,
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

  final _i13.RfqController? controllerEx;

  final _i9.Key? key;

  @override
  String toString() {
    return 'RfqRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}
