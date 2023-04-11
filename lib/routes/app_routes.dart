import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/dashboard.page.dart';
import 'package:builtop_admin_dashboard/modules/login/login.page.dart';
import 'package:builtop_admin_dashboard/modules/users/admins/admins.page.dart';
import 'package:builtop_admin_dashboard/widgets/menu_bar_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // RedirectRoute(path: '*', redirectTo: '/'),
    AutoRoute(
      path: 'login',
      page: LoginPage,
    ),
    AutoRoute(
      path: '/',
      page: MenuBarPage,
      children: [
        AutoRoute(path: 'dashboard', page: DashboardPage, initial: true),
        AutoRoute(path: 'admins', page: AdminsPage),
      ],
    ),
  ],
)
class $AppRouter {}
