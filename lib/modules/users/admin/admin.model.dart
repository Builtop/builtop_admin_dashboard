import 'package:builtop_admin_dashboard/models/user.dart';

class Admin extends User {
  Admin();

  Admin.fromJson(Map<String, dynamic> data) {
    fromJson(data);
  }
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return super.toJson();
  }
}
