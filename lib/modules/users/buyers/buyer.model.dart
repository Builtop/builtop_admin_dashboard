import 'package:builtop_admin_dashboard/models/user.dart';

class Buyer extends User {
  Buyer();

  Buyer.fromJson(Map<String, dynamic> data) {
    fromJson(data);
  }
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return super.toJson();
  }
}
