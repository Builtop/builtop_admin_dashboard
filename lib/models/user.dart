import 'package:builtop_admin_dashboard/models/info.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

abstract class User {
  String? id;
  String? phoneNum;

  String? password;
  List<String>? privileges;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Info? info;

  void fromJson(Map<String, dynamic> data) {
    id = data['_id'];
    phoneNum = data['phoneNum'];
    password = data['password'];
    privileges = data['privileges'] != null
        ? List<String>.from(data['privileges'])
        : null;
    status = data['status'];
    info = data['info'] != null ? Info.fromJson(data['info']) : null;
    createdAt = MahgModel.parseUTC(data['createdAt']);
    updatedAt = MahgModel.parseUTC(data['updatedAt']);
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "phoneNum": phoneNum,
        "password": password,
        "privileges": privileges,
        "status": status,
        "info": info?.toJson(),
        "createdAt": createdAt,
      };
}
