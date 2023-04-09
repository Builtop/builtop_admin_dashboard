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

import '../modules/dashboard/dashboard.page.dart' as _i4;
import '../modules/login/login.page.dart' as _i1;
import '../modules/users/admins/admins.page.dart' as _i3;
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
    AdminsRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AdminsPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.DashboardPage(),
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
              AdminsRoute.name,
              path: 'admins',
              parent: MenuBarRoute.name,
            ),
            _i5.RouteConfig(
              DashboardRoute.name,
              path: 'dashboard',
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
/// [_i3.AdminsPage]
class AdminsRoute extends _i5.PageRouteInfo<void> {
  const AdminsRoute()
      : super(
          AdminsRoute.name,
          path: 'admins',
        );

  static const String name = 'AdminsRoute';
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: 'dashboard',
        );

  static const String name = 'DashboardRoute';
}
