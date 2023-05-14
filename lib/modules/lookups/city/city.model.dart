import 'package:builtop_admin_dashboard/models/created_user.model.dart';
import 'package:builtop_admin_dashboard/models/lat_lng.model.dart';
import 'package:builtop_admin_dashboard/modules/lookups/country/country.model.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class City {
  String? id;
  String? name;
  Latlng? latlng;
  CreatedUser? createdUser;
  Country? country;
  String? status;
  DateTime? createdAt;

  City();

  City.fromJson(Map<String, dynamic> data) {
    id = data['_id'];
    name = data['name'];
    latlng = data['latlng'] != null ? Latlng.fromJson(data['latlng']) : null;
    createdUser = data['createdUser'] != null
        ? CreatedUser.fromJson(data['createdUser'])
        : null;
    country =
        data['country'] != null ? Country.fromJson(data['country']) : null;
    status = data['status'];
    createdAt = MahgModel.parseUTC(data['createdAt']);
  }
  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "latlng": latlng?.toJson(),
        "createdUser": createdUser?.toJson(),
        "country": country?.toJson(),
        "status": status,
        "createdAt": createdAt,
      };
}
