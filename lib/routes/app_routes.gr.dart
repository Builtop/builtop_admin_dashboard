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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../modules/dashboard/dashboard.controller.dart' as _i7;
import '../modules/dashboard/dashboard.page.dart' as _i3;
import '../modules/login/login.page.dart' as _i1;
import '../modules/users/admins/admins.page.dart' as _i4;
import '../widgets/menu_bar_page.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    MenuBarRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MenuBarPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardRouteArgs>(
          orElse: () => const DashboardRouteArgs());
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.DashboardPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    AdminsRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.AdminsPage(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          LoginRoute.name,
          path: 'login',
        ),
        _i5.RouteConfig(
          MenuBarRoute.name,
          path: '/',
          children: [
            _i5.RouteConfig(
              '#redirect',
              path: '',
              parent: MenuBarRoute.name,
              redirectTo: 'dashboard',
              fullMatch: true,
            ),
            _i5.RouteConfig(
              DashboardRoute.name,
              path: 'dashboard',
              parent: MenuBarRoute.name,
            ),
            _i5.RouteConfig(
              AdminsRoute.name,
              path: 'admins',
              parent: MenuBarRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.MenuBarPage]
class MenuBarRoute extends _i5.PageRouteInfo<void> {
  const MenuBarRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MenuBarRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MenuBarRoute';
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    _i7.DashboardController? controllerEx,
    _i6.Key? key,
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

  final _i7.DashboardController? controllerEx;

  final _i6.Key? key;

  @override
  String toString() {
    return 'DashboardRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i4.AdminsPage]
class AdminsRoute extends _i5.PageRouteInfo<void> {
  const AdminsRoute()
      : super(
          AdminsRoute.name,
          path: 'admins',
        );

  static const String name = 'AdminsRoute';
}
