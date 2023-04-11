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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../modules/dashboard/dashboard.page.dart' as _i3;
import '../modules/login/login.page.dart' as _i1;
import '../modules/users/admins/admins.page.dart' as _i4;
import '../modules/users/admins/admins_details.page.dart' as _i5;
import '../widgets/menu_bar_page.dart' as _i2;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    MenuBarRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MenuBarPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardPage(),
      );
    },
    AdminsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.AdminsPage(),
      );
    },
    AdminsDetailsRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<AdminsDetailsRouteArgs>(
          orElse: () =>
              AdminsDetailsRouteArgs(id: queryParams.optString('id')));
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.AdminsDetailsPage(
          id: args.id,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          LoginRoute.name,
          path: 'login',
        ),
        _i6.RouteConfig(
          MenuBarRoute.name,
          path: '/',
          children: [
            _i6.RouteConfig(
              '#redirect',
              path: '',
              parent: MenuBarRoute.name,
              redirectTo: 'dashboard',
              fullMatch: true,
            ),
            _i6.RouteConfig(
              DashboardRoute.name,
              path: 'dashboard',
              parent: MenuBarRoute.name,
            ),
            _i6.RouteConfig(
              AdminsRoute.name,
              path: 'admins',
              parent: MenuBarRoute.name,
            ),
            _i6.RouteConfig(
              AdminsDetailsRoute.name,
              path: 'admins/details',
              parent: MenuBarRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.MenuBarPage]
class MenuBarRoute extends _i6.PageRouteInfo<void> {
  const MenuBarRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MenuBarRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MenuBarRoute';
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: 'dashboard',
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i4.AdminsPage]
class AdminsRoute extends _i6.PageRouteInfo<void> {
  const AdminsRoute()
      : super(
          AdminsRoute.name,
          path: 'admins',
        );

  static const String name = 'AdminsRoute';
}

/// generated route for
/// [_i5.AdminsDetailsPage]
class AdminsDetailsRoute extends _i6.PageRouteInfo<AdminsDetailsRouteArgs> {
  AdminsDetailsRoute({
    String? id,
    _i7.Key? key,
  }) : super(
          AdminsDetailsRoute.name,
          path: 'admins/details',
          args: AdminsDetailsRouteArgs(
            id: id,
            key: key,
          ),
          rawQueryParams: {'id': id},
        );

  static const String name = 'AdminsDetailsRoute';
}

class AdminsDetailsRouteArgs {
  const AdminsDetailsRouteArgs({
    this.id,
    this.key,
  });

  final String? id;

  final _i7.Key? key;

  @override
  String toString() {
    return 'AdminsDetailsRouteArgs{id: $id, key: $key}';
  }
}
