import 'package:builtop_admin_dashboard/models/created_user.model.dart';
import 'package:builtop_admin_dashboard/models/lat_lng.model.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class Country {
  String? id;
  Map<String, String>? name;
  Latlng? latlng;
  CreatedUser? createdUser;
  String? image;
  String? status;
  DateTime? createdAt;

  Country();

  Country.fromJson(Map<String, dynamic> data) {
    id = data['_id'];
    name = data['name'] != null ? Map<String, String>.from(data['name']) : null;
    latlng = data['latlng'] != null ? Latlng.fromJson(data['latlng']) : null;
    createdUser = data['createdUser'] != null
        ? CreatedUser.fromJson(data['createdUser'])
        : null;
    image = data['image'];
    status = data['status'];
    createdAt = MahgModel.parseUTC(data['createdAt']);
  }
  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "latlng": latlng?.toJson(),
        "createdUser": createdUser?.toJson(),
        "image": image,
        "status": status,
        "createdAt": createdAt,
      };
}
