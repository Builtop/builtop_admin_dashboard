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
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/material.dart' as _i19;

import '../modules/dashboard/dashboard.controller.dart' as _i21;
import '../modules/dashboard/dashboard.page.dart' as _i3;
import '../modules/login/login.controller.dart' as _i20;
import '../modules/login/login.page.dart' as _i1;
import '../modules/lookups/city/city.controller.dart' as _i29;
import '../modules/lookups/city/city.page.dart' as _i15;
import '../modules/lookups/city/city_details.page.dart' as _i16;
import '../modules/lookups/country/country.controller.dart' as _i28;
import '../modules/lookups/country/country.page.dart' as _i14;
import '../modules/lookups/country/country_details.page.dart' as _i17;
import '../modules/requests/rfq/rfq.controller.dart' as _i26;
import '../modules/requests/rfq/rfq.page.dart' as _i12;
import '../modules/users/admin/admin_details.page.dart' as _i13;
import '../modules/users/admin/admins.controller.dart' as _i27;
import '../modules/users/buyers/buyer_details.page.dart' as _i11;
import '../modules/users/buyers/buyers.controller.dart' as _i25;
import '../modules/users/buyers/buyers.page.dart' as _i10;
import '../modules/users/pendings/pending_user_details.page.dart' as _i7;
import '../modules/users/pendings/pending_users.controller.dart' as _i23;
import '../modules/users/pendings/pending_users.page.dart' as _i6;
import '../modules/users/supervisors/supervisor_details.page.dart' as _i5;
import '../modules/users/supervisors/supervisors.controller.dart' as _i22;
import '../modules/users/supervisors/supervisors.page.dart' as _i4;
import '../modules/users/suppliers/supplier_details.page.dart' as _i9;
import '../modules/users/suppliers/suppliers.controller.dart' as _i24;
import '../modules/users/suppliers/suppliers.page.dart' as _i8;
import '../widgets/menu_bar_page.dart' as _i2;

class AppRouter extends _i18.RootStackRouter {
  AppRouter([_i19.GlobalKey<_i19.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i18.MaterialPageX<dynamic>(
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
      return _i18.MaterialPageX<dynamic>(
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
      return _i18.MaterialPageX<dynamic>(
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
      return _i18.MaterialPageX<dynamic>(
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
      return _i18.MaterialPageX<dynamic>(
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
      return _i18.MaterialPageX<dynamic>(
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
      return _i18.MaterialPageX<dynamic>(
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
      return _i18.MaterialPageX<dynamic>(
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
      return _i18.MaterialPageX<dynamic>(
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
      return _i18.MaterialPageX<dynamic>(
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
      return _i18.MaterialPageX<dynamic>(
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
      return _i18.MaterialPageX<dynamic>(
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
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.AdminDetailsPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    CountryRoute.name: (routeData) {
      final args = routeData.argsAs<CountryRouteArgs>(
          orElse: () => const CountryRouteArgs());
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.CountryPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    CityRoute.name: (routeData) {
      final args =
          routeData.argsAs<CityRouteArgs>(orElse: () => const CityRouteArgs());
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.CityPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    CityDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CityDetailsRouteArgs>(
          orElse: () => const CityDetailsRouteArgs());
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.CityDetailsPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
    CountryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CountryDetailsRouteArgs>(
          orElse: () => const CountryDetailsRouteArgs());
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.CountryDetailsPage(
          controllerEx: args.controllerEx,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i18.RouteConfig> get routes => [
        _i18.RouteConfig(
          LoginRoute.name,
          path: 'login',
        ),
        _i18.RouteConfig(
          MenuBarRoute.name,
          path: '/',
          children: [
            _i18.RouteConfig(
              '#redirect',
              path: '',
              parent: MenuBarRoute.name,
              redirectTo: 'dashboard',
              fullMatch: true,
            ),
            _i18.RouteConfig(
              DashboardRoute.name,
              path: 'dashboard',
              parent: MenuBarRoute.name,
            ),
            _i18.RouteConfig(
              SupervisorsRoute.name,
              path: 'supervisors',
              parent: MenuBarRoute.name,
            ),
            _i18.RouteConfig(
              SupervisorDetailsRoute.name,
              path: 'supervisorDetails',
              parent: MenuBarRoute.name,
            ),
            _i18.RouteConfig(
              PendingUsersRoute.name,
              path: 'pending-users',
              parent: MenuBarRoute.name,
            ),
            _i18.RouteConfig(
              PendingUsersDetailsRoute.name,
              path: 'pendingUsersDetails',
              parent: MenuBarRoute.name,
            ),
            _i18.RouteConfig(
              SuppliersRoute.name,
              path: 'suppliers',
              parent: MenuBarRoute.name,
            ),
            _i18.RouteConfig(
              SupplierDetailsRoute.name,
              path: 'supplierDetails',
              parent: MenuBarRoute.name,
            ),
            _i18.RouteConfig(
              BuyersRoute.name,
              path: 'buyers',
              parent: MenuBarRoute.name,
            ),
            _i18.RouteConfig(
              BuyerDetailsRoute.name,
              path: 'buyerDetails',
              parent: MenuBarRoute.name,
            ),
            _i18.RouteConfig(
              RfqRoute.name,
              path: 'rfq',
              parent: MenuBarRoute.name,
            ),
            _i18.RouteConfig(
              AdminDetailsRoute.name,
              path: 'adminDetails',
              parent: MenuBarRoute.name,
            ),
            _i18.RouteConfig(
              CountryRoute.name,
              path: 'countries',
              parent: MenuBarRoute.name,
            ),
            _i18.RouteConfig(
              CityRoute.name,
              path: 'cities',
              parent: MenuBarRoute.name,
            ),
            _i18.RouteConfig(
              CityDetailsRoute.name,
              path: 'cityDetails',
              parent: MenuBarRoute.name,
            ),
            _i18.RouteConfig(
              CountryDetailsRoute.name,
              path: 'countryDetails',
              parent: MenuBarRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i18.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i20.LoginController? controllerEx,
    _i19.Key? key,
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

  final _i20.LoginController? controllerEx;

  final _i19.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i2.MenuBarPage]
class MenuBarRoute extends _i18.PageRouteInfo<MenuBarRouteArgs> {
  MenuBarRoute({
    _i19.Key? key,
    _i19.Widget Function()? body,
    List<_i18.PageRouteInfo>? children,
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

  final _i19.Key? key;

  final _i19.Widget Function()? body;

  @override
  String toString() {
    return 'MenuBarRouteArgs{key: $key, body: $body}';
  }
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i18.PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    _i21.DashboardController? controllerEx,
    _i19.Key? key,
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

  final _i21.DashboardController? controllerEx;

  final _i19.Key? key;

  @override
  String toString() {
    return 'DashboardRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i4.SupervisorsPage]
class SupervisorsRoute extends _i18.PageRouteInfo<SupervisorsRouteArgs> {
  SupervisorsRoute({
    _i22.SupervisorsController? controllerEx,
    _i19.Key? key,
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

  final _i22.SupervisorsController? controllerEx;

  final _i19.Key? key;

  @override
  String toString() {
    return 'SupervisorsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i5.SupervisorDetailsPage]
class SupervisorDetailsRoute
    extends _i18.PageRouteInfo<SupervisorDetailsRouteArgs> {
  SupervisorDetailsRoute({
    _i22.SupervisorsController? controllerEx,
    _i19.Key? key,
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

  final _i22.SupervisorsController? controllerEx;

  final _i19.Key? key;

  @override
  String toString() {
    return 'SupervisorDetailsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i6.PendingUsersPage]
class PendingUsersRoute extends _i18.PageRouteInfo<PendingUsersRouteArgs> {
  PendingUsersRoute({
    _i23.PendingUsersController? controllerEx,
    _i19.Key? key,
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

  final _i23.PendingUsersController? controllerEx;

  final _i19.Key? key;

  @override
  String toString() {
    return 'PendingUsersRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i7.PendingUsersDetailsPage]
class PendingUsersDetailsRoute
    extends _i18.PageRouteInfo<PendingUsersDetailsRouteArgs> {
  PendingUsersDetailsRoute({
    _i23.PendingUsersController? controllerEx,
    _i19.Key? key,
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

  final _i23.PendingUsersController? controllerEx;

  final _i19.Key? key;

  @override
  String toString() {
    return 'PendingUsersDetailsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i8.SuppliersPage]
class SuppliersRoute extends _i18.PageRouteInfo<SuppliersRouteArgs> {
  SuppliersRoute({
    _i24.SuppliersController? controllerEx,
    _i19.Key? key,
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

  final _i24.SuppliersController? controllerEx;

  final _i19.Key? key;

  @override
  String toString() {
    return 'SuppliersRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i9.SupplierDetailsPage]
class SupplierDetailsRoute
    extends _i18.PageRouteInfo<SupplierDetailsRouteArgs> {
  SupplierDetailsRoute({
    _i24.SuppliersController? controllerEx,
    _i19.Key? key,
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

  final _i24.SuppliersController? controllerEx;

  final _i19.Key? key;

  @override
  String toString() {
    return 'SupplierDetailsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i10.BuyersPage]
class BuyersRoute extends _i18.PageRouteInfo<BuyersRouteArgs> {
  BuyersRoute({
    _i25.BuyersController? controllerEx,
    _i19.Key? key,
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

  final _i25.BuyersController? controllerEx;

  final _i19.Key? key;

  @override
  String toString() {
    return 'BuyersRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i11.BuyerDetailsPage]
class BuyerDetailsRoute extends _i18.PageRouteInfo<BuyerDetailsRouteArgs> {
  BuyerDetailsRoute({
    _i25.BuyersController? controllerEx,
    _i19.Key? key,
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

  final _i25.BuyersController? controllerEx;

  final _i19.Key? key;

  @override
  String toString() {
    return 'BuyerDetailsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i12.RfqPage]
class RfqRoute extends _i18.PageRouteInfo<RfqRouteArgs> {
  RfqRoute({
    _i26.RfqController? controllerEx,
    _i19.Key? key,
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

  final _i26.RfqController? controllerEx;

  final _i19.Key? key;

  @override
  String toString() {
    return 'RfqRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i13.AdminDetailsPage]
class AdminDetailsRoute extends _i18.PageRouteInfo<AdminDetailsRouteArgs> {
  AdminDetailsRoute({
    _i27.AdminsController? controllerEx,
    _i19.Key? key,
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

  final _i27.AdminsController? controllerEx;

  final _i19.Key? key;

  @override
  String toString() {
    return 'AdminDetailsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i14.CountryPage]
class CountryRoute extends _i18.PageRouteInfo<CountryRouteArgs> {
  CountryRoute({
    _i28.CountryController? controllerEx,
    _i19.Key? key,
  }) : super(
          CountryRoute.name,
          path: 'countries',
          args: CountryRouteArgs(
            controllerEx: controllerEx,
            key: key,
          ),
        );

  static const String name = 'CountryRoute';
}

class CountryRouteArgs {
  const CountryRouteArgs({
    this.controllerEx,
    this.key,
  });

  final _i28.CountryController? controllerEx;

  final _i19.Key? key;

  @override
  String toString() {
    return 'CountryRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i15.CityPage]
class CityRoute extends _i18.PageRouteInfo<CityRouteArgs> {
  CityRoute({
    _i29.CityController? controllerEx,
    _i19.Key? key,
  }) : super(
          CityRoute.name,
          path: 'cities',
          args: CityRouteArgs(
            controllerEx: controllerEx,
            key: key,
          ),
        );

  static const String name = 'CityRoute';
}

class CityRouteArgs {
  const CityRouteArgs({
    this.controllerEx,
    this.key,
  });

  final _i29.CityController? controllerEx;

  final _i19.Key? key;

  @override
  String toString() {
    return 'CityRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i16.CityDetailsPage]
class CityDetailsRoute extends _i18.PageRouteInfo<CityDetailsRouteArgs> {
  CityDetailsRoute({
    _i29.CityController? controllerEx,
    _i19.Key? key,
  }) : super(
          CityDetailsRoute.name,
          path: 'cityDetails',
          args: CityDetailsRouteArgs(
            controllerEx: controllerEx,
            key: key,
          ),
        );

  static const String name = 'CityDetailsRoute';
}

class CityDetailsRouteArgs {
  const CityDetailsRouteArgs({
    this.controllerEx,
    this.key,
  });

  final _i29.CityController? controllerEx;

  final _i19.Key? key;

  @override
  String toString() {
    return 'CityDetailsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}

/// generated route for
/// [_i17.CountryDetailsPage]
class CountryDetailsRoute extends _i18.PageRouteInfo<CountryDetailsRouteArgs> {
  CountryDetailsRoute({
    _i28.CountryController? controllerEx,
    _i19.Key? key,
  }) : super(
          CountryDetailsRoute.name,
          path: 'countryDetails',
          args: CountryDetailsRouteArgs(
            controllerEx: controllerEx,
            key: key,
          ),
        );

  static const String name = 'CountryDetailsRoute';
}

class CountryDetailsRouteArgs {
  const CountryDetailsRouteArgs({
    this.controllerEx,
    this.key,
  });

  final _i28.CountryController? controllerEx;

  final _i19.Key? key;

  @override
  String toString() {
    return 'CountryDetailsRouteArgs{controllerEx: $controllerEx, key: $key}';
  }
}
