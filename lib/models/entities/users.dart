class Users {
  String id;
  String first_name;
  String last_name;
  String email;
  String phone;
  String password;
  String profile_img;
  String created_at;
  String updated_at;

  Users({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.phone,
    required this.password,
    required this.profile_img,
    required this.created_at,
    required this.updated_at,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["users_id"] ?? "",
        first_name: json["users_first_name"] ?? "",
        last_name: json["users_last_name"] ?? "",
        email: json["users_email"] ?? "",
        phone: json["users_phone"] ?? "",
        password: json["users_password"] ?? "",
        profile_img: json["users_profile_img"] ?? "",
        created_at: json["users_created_at"] ?? "",
        updated_at: json["users_updated_at"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "users_id": id,
        "users_first_name": first_name,
        "users_last_name": last_name,
        "users_email": email,
        "users_phone": phone,
        "users_password": password,
        "users_profile_img": profile_img,
        "users_created_at": created_at,
        "users_updated_at": updated_at,
      };
}
