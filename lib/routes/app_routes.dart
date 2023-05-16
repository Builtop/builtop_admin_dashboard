import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/dashboard.page.dart';
import 'package:builtop_admin_dashboard/modules/login/login.page.dart';
import 'package:builtop_admin_dashboard/modules/lookups/city/city.page.dart';
import 'package:builtop_admin_dashboard/modules/lookups/city/city_details.page.dart';
import 'package:builtop_admin_dashboard/modules/lookups/country/country.page.dart';
import 'package:builtop_admin_dashboard/modules/lookups/country/country_details.page.dart';
import 'package:builtop_admin_dashboard/modules/requests/rfq/rfq.page.dart';
import 'package:builtop_admin_dashboard/modules/users/admin/admin_details.page.dart';
import 'package:builtop_admin_dashboard/modules/users/admin/admins.page.dart';
import 'package:builtop_admin_dashboard/modules/users/buyers/buyer_details.page.dart';
import 'package:builtop_admin_dashboard/modules/users/buyers/buyers.page.dart';
import 'package:builtop_admin_dashboard/modules/users/pendings/pending_users.page.dart';
import 'package:builtop_admin_dashboard/modules/users/pendings/pending_user_details.page.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisor_details.page.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisors.page.dart';
import 'package:builtop_admin_dashboard/modules/users/suppliers/supplier_details.page.dart';
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
        AutoRoute(path: 'pending-users', page: PendingUsersPage),
        AutoRoute(path: 'pendingUsersDetails', page: PendingUsersDetailsPage),
        AutoRoute(path: 'suppliers', page: SuppliersPage),
        AutoRoute(path: 'supplierDetails', page: SupplierDetailsPage),
        AutoRoute(path: 'buyers', page: BuyersPage),
        AutoRoute(path: 'buyerDetails', page: BuyerDetailsPage),
        AutoRoute(path: 'rfq', page: RfqPage),
        AutoRoute(path: 'adminDetails', page: AdminDetailsPage),
        AutoRoute(path: 'countries', page: CountryPage),
        AutoRoute(path: 'cities', page: CityPage),
        AutoRoute(path: 'cityDetails', page: CityDetailsPage),
        AutoRoute(path: 'countryDetails', page: CountryDetailsPage),
      ],
    ),
  ],
)
class $AppRouter {}
