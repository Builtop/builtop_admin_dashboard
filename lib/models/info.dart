class Info {
  String? name;
  String? role;
  String? email;
  String? image;

  Info();

  Info.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    role = data['role'];
    email = data['email'];
    image = data['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "role": role,
      "email": email,
      "image": image,
    };
  }
}
