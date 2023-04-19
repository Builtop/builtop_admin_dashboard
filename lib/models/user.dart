import 'package:mahg_essential_package/mahg_essential_package.dart';

abstract class User {
  String? id;
  String? email;
  List<String>? privileges;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  void fromJson(Map<String, dynamic> data) {
    id = data['_id'];
    email = data['email'];
    privileges = data['privileges'] != null
        ? List<String>.from(data['privileges'])
        : null;
    status = data['status'];
    createdAt = MahgModel.parseUTC(data['createdAt']);
    updatedAt = MahgModel.parseUTC(data['updatedAt']);
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "privileges": privileges,
        "status": status,
      };
}
