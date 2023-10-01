import 'package:expert_reach/models/entities/locations.dart';
import 'package:expert_reach/models/entities/services.dart';

class ServicesLocations {
  Services services;
  Locations locations;
  String stars;

  ServicesLocations({
    required this.services,
    required this.locations,
    required this.stars,
  });

  factory ServicesLocations.fromJson(Map<String, dynamic> json) {
    return ServicesLocations(
      services: Services.fromJson(json),
      locations: Locations.fromJson(json),
      stars: json['stars'] ?? "0",
    );
  }

  Map<String, dynamic> toJson() => {
        ...services.toJson(),
        ...locations.toJson(),
        "stars": stars,
      };
}
