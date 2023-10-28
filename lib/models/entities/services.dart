class Services {
  String id;
  String user_id;
  String title;
  String description;
  String location_id;
  String rates;
  String image;
  String created_at;
  String updated_at;
  String is_active;

  Services({
    required this.id,
    required this.user_id,
    required this.title,
    required this.description,
    required this.location_id,
    required this.rates,
    required this.image,
    required this.created_at,
    required this.updated_at,
    required this.is_active,
  });

  factory Services.fromJson(Map<String, dynamic> json) {
    return Services(
      id: json['services_id'] ?? "",
      user_id: json['services_user_id'] ?? "",
      title: json['services_title'] ?? "",
      description: json['services_description'] ?? "",
      location_id: json['services_location_id'] ?? "",
      rates: json['services_rates'] ?? "",
      image: json['services_image'] ?? "",
      created_at: json['services_created_at'] ?? "",
      updated_at: json['services_updated_at'] ?? "",
      is_active: json['services_is_active'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "services_id": id,
        "services_user_id": user_id,
        "services_title": title,
        "services_description": description,
        "services_location_id": location_id,
        "services_rates": rates,
        "services_image": image,
        "services_created_at": created_at,
        "services_updated_at": updated_at,
        "services_is_active": is_active,
      };
}
