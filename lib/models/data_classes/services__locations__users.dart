import 'package:expert_reach/models/entities/locations.dart';
import 'package:expert_reach/models/entities/services.dart';
import 'package:expert_reach/models/entities/users.dart';

class ServicesWithLocationsWithUsers {
  Services services;
  Locations locations;
  Users users;
  String stars;

  ServicesWithLocationsWithUsers({
    required this.services,
    required this.locations,
    required this.users,
    required this.stars,
  });

  factory ServicesWithLocationsWithUsers.fromJson(Map<String, dynamic> json) {
    return ServicesWithLocationsWithUsers(
      services: Services.fromJson(json),
      locations: Locations.fromJson(json),
      users: Users.fromJson(json),
      stars: json['stars'] ?? '0',
    );
  }
}
