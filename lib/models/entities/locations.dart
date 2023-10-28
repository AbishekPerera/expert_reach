class Locations {
  String id;
  String name;

  Locations({required this.id, required this.name});

  factory Locations.fromJson(Map<String, dynamic> json) {
    return Locations(
        id: json['locations_id'] ?? "", name: json['locations_name'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {'locations_id': id, 'locations_name': name};
  }
}
