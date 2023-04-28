import 'package:builtop_admin_dashboard/models/user.dart';

class Supplier extends User {
  Supplier();

  Supplier.fromJson(Map<String, dynamic> data) {
    fromJson(data);
  }
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return super.toJson();
  }
}
