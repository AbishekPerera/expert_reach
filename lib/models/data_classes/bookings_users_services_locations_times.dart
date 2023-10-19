import 'package:expert_reach/models/entities/bookings.dart';
import 'package:expert_reach/models/entities/locations.dart';
import 'package:expert_reach/models/entities/services.dart';
import 'package:expert_reach/models/entities/times.dart';
import 'package:expert_reach/models/entities/users.dart';

class BookingsUsersServicesLocationsTimes {
  Bookings bookings;
  Users users;
  Services services;
  Locations locations;
  Times times;

  BookingsUsersServicesLocationsTimes({
    required this.bookings,
    required this.users,
    required this.services,
    required this.locations,
    required this.times,
  });

  factory BookingsUsersServicesLocationsTimes.fromJson(
      Map<String, dynamic> json) {
    return BookingsUsersServicesLocationsTimes(
      bookings: Bookings.fromJson(json),
      users: Users.fromJson(json),
      services: Services.fromJson(json),
      locations: Locations.fromJson(json),
      times: Times.fromJson(json),
    );
  }
}
