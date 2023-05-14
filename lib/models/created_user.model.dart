class CreatedUser {
  String? id;
  String? email;
  String? phoneNum;

  CreatedUser();
  CreatedUser.fromJson(Map<String, dynamic> data) {
    id = data['_id'];
    email = data['email'];
    phoneNum = data['phoneNum'];
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "phoneNum": phoneNum,
      };
}
