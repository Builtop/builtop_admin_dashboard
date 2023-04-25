import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/dashboard.page.dart';
import 'package:builtop_admin_dashboard/modules/login/login.page.dart';
import 'package:builtop_admin_dashboard/modules/requests/rfq/rfq.page.dart';
import 'package:builtop_admin_dashboard/modules/users/admins/admin_details.page.dart';
import 'package:builtop_admin_dashboard/modules/users/admins/admins.page.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisor_details.page.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisors.page.dart';
import 'package:builtop_admin_dashboard/modules/users/suppliers/suppliers.page.dart';
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
        AutoRoute(path: 'supervisors', page: SupervisorsPage),
        AutoRoute(path: 'supervisorDetails', page: SupervisorDetailsPage),
        AutoRoute(path: 'suppliers', page: SuppliersPage),
        AutoRoute(path: 'rfq', page: RfqPage),
      ],
    ),
  ],
)
class $AppRouter {}
