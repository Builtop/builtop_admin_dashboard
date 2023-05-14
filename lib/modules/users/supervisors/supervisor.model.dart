import 'package:builtop_admin_dashboard/models/user.model.dart';

class Supervisor extends User {
  Supervisor();

  Supervisor.fromJson(Map<String, dynamic> data) {
    fromJson(data);
  }
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return super.toJson();
  }
}
