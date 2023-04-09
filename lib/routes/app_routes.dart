import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/dashboard.page.dart';
import 'package:builtop_admin_dashboard/modules/login/login.page.dart';
import 'package:builtop_admin_dashboard/modules/users/admins/admins.page.dart';
import 'package:builtop_admin_dashboard/widgets/menu_bar_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: 'login',
      page: LoginPage,
    ),
    AutoRoute(
      path: '/',
      page: MenuBarPage,
      children: [
        AutoRoute(path: 'admins', page: AdminsPage),
        AutoRoute(path: 'dashboard', page: DashboardPage, initial: true),
      ],
    ),
  ],
)
class $AppRouter {}
