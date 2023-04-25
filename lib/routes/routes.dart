import 'package:builtop_admin_dashboard/constants/string.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/dashboard.page.dart';
import 'package:builtop_admin_dashboard/modules/requests/rfq/rfq.page.dart';
import 'package:builtop_admin_dashboard/modules/users/admins/admin_details.page.dart';
import 'package:builtop_admin_dashboard/modules/users/admins/admins.page.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisor_details.page.dart';
import 'package:builtop_admin_dashboard/modules/users/supervisors/supervisors.page.dart';
import 'package:builtop_admin_dashboard/modules/users/suppliers/suppliers.page.dart';
import 'package:builtop_admin_dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';

int getRouteIndex(String route) {
  if (route == Strings.supervisors) {
    return 1;
  } else if (route == Strings.suppliers) {
    return 2;
  } else if (route == Strings.rfq) {
    return 3;
  } else if (route == Strings.supervisorDetails.capitalize()) {
    return 4;
  } else {
    return 0;
  }
}

Widget getRouteWidget(int index) {
  // return DashboardPage();

  if (index == 1) {
    return SupervisorsPage();
  } else if (index == 2) {
    return SuppliersPage();
  } else if (index == 3) {
    return RfqPage();
  } else if (index == 4) {
    return SupervisorDetailsPage();
  } else {
    return DashboardPage();
  }

  // if (index == 1) {
  //   return Button();
  // } else if (index == 2) {
  //   return Rating();
  // } else if (index == 3) {
  //   return CustomBadge();
  // } else if (index == 4) {
  //   return Toast();
  // } else if (index == 5) {
  //   return AlertDialogBox();
  // } else if (index == 6) {
  //   return Modal();
  // } else if (index == 7) {
  //   return BasicEmail();
  // } else if (index == 8) {
  //   return AlertEmail();
  // } else if (index == 9) {
  //   return BillingEmail();
  // } else if (index == 10) {
  //   return Loaders();
  // } else if (index == 11) {
  //   return MorrisChart();
  // } else if (index == 12) {
  //   return ChartListChart();
  // } else if (index == 13) {
  //   return ChartJsChart();
  // } else if (index == 14) {
  //   return BasicTable();
  // } else if (index == 15) {
  //   return Datatable();
  // } else if (index == 16) {
  //   return ResponsiveTable();
  // } else if (index == 17) {
  //   return EditableTable();
  // } else if (index == 18) {
  //   return TimelineScreen();
  // } else if (index == 19) {
  //   return Pricing();
  // } else if (index == 20) {
  //   return DirectoryPage();
  // } else if (index == 21) {
  //   return FAQs();
  // } else if (index == 22) {
  //   return Invoice();
  // } else if (index == 23) {
  //   return Gallery();
  // } else if (index == 24) {
  //   return Carousel();
  // } else if (index == 25) {
  //   return TabScreen();
  // } else if (index == 26) {
  //   return Calendar();
  // } else if (index == 27) {
  //   return ElementsForm();
  // } else if (index == 28) {
  //   return ValidationForm();
  // } else if (index == 29) {
  //   return FileUploadForm();
  // } else if (index == 30) {
  //   return RepeaterForm();
  // } else if (index == 31) {
  //   return WizardForm();
  // } else if (index == 32) {
  //   return MaskForm();
  // } else if (index == 33) {
  //   return VideoScreen();
  // } else if (index == 34) {
  //   return GoogleMaps();
  // } else if (index == 35) {
  //   return UserProfile();
  // } else if (index == 36) {
  //   return DragAndDrop();
  // } else if (index == 37) {
  //   return DatePicker();
  // } else if (index == 38) {
  //   return ProductsScreen();
  // } else if (index == 39) {
  //   return ProductDetailScreen();
  // } else if (index == 40) {
  //   return CategoryScreen();
  // } else if (index == 41) {
  //   return SubCategoryScreen();
  // } else if (index == 42) {
  //   return VenderScreen();
  // } else if (index == 43) {
  //   return VenderDetailScreen();
  // } else if (index == 44) {
  //   return CustomerScreen();
  // } else if (index == 45) {
  //   return PaymentScreen();
  // } else if (index == 46) {
  //   return ReturnOrderScreen();
  // } else if (index == 47) {
  //   return ReturnOrderInvoice();
  // } else if (index == 48) {
  //   return SubScriptionScreen();
  // } else if (index == 49) {
  //   return CouponsScreen();
  // } else if (index == 50) {
  //   return OrderScreen();
  // } else if (index == 51) {
  //   return OrderInvoice();
  // } else if (index == 52) {
  //   return ReturnConditionScreen();
  // } else if (index == 53) {
  //   return EcommerceDashboard();
  // } else if (index == 54) {
  //   return CartScreen();
  // } else if (index == 55) {
  //   return ProductAdd();
  // } else if (index == 56) {
  //   return SuccessScreen();
  // } else if (index == 57) {
  //   return DropDownScreen();
  // }
  // // else if (index == 58) {
  // //   return ECLandingPage();
  // // }
  // else {
  //   return Dashboard();
  // }
}

// Widget getECRouteWidget(int index) {
//   if (index == 1) {
//     return BlogScreen();
//   } else if (index == 2) {
//     return AllCategoryScreen();
//   } else if (index == 3) {
//     return AllBrandScreen();
//   } else if (index == 4) {
//     return OffersScreen();
//   } else if (index == 5) {
//     return CompareScreen();
//   } else if (index == 6) {
//     return WishList();
//   } else if (index == 7) {
//     return ECartScreen();
//   } else if (index == 8) {
//     return ELogin();
//   } else if (index == 9) {
//     return ERegister();
//   } else if (index == 10) {
//     return EForgot();
//   } else if (index == 11) {
//     return TrackOrder();
//   } else if (index == 12) {
//     return OrderHistory();
//   } else if (index == 13) {
//     return ShowProductDetails();
//   } else if (index == 14) {
//     return LandingPaymentScreen();
//   } else if (index == 15) {
//     return LandingSuccessScreen();
//   } else if (index == 16) {
//     return BlogDetailsScreen();
//   } else {
//     return ProductHomeScreen();
//   }
// }
