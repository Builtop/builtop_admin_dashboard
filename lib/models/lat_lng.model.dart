class Latlng {
  String? lat;
  String? lng;

  Latlng();
  Latlng.fromJson(Map<String, dynamic> data) {
    lat = data['lat'];
    lng = data['lng'];
  }

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
