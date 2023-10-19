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
  List<Times> timesList;

  BookingsUsersServicesLocationsTimes({
    required this.bookings,
    required this.users,
    required this.services,
    required this.locations,
    required this.times,
    required this.timesList,
  });

  factory BookingsUsersServicesLocationsTimes.fromJson(
      Map<String, dynamic> json) {
    return BookingsUsersServicesLocationsTimes(
      bookings: Bookings.fromJson(json),
      users: Users.fromJson(json),
      services: Services.fromJson(json),
      locations: Locations.fromJson(json),
      times: Times.fromJson(json),
      timesList: json['booked_times'] != null
          ? (json['booked_times'] as List)
              .map((i) => Times.fromJson(i))
              .toList()
          : [],
    );
  }
}

// {
//                 "bookings_id": "1",
//                 "bookings_customer_id": "1",
//                 "bookings_service_provider_id": "1",
//                 "bookings_service_id": "8",
//                 "bookings_date": "2023-10-27",
//                 "bookings_time_from": "2,3,4",
//                 "bookings_notes": "your_notes_value",
//                 "bookings_status": "Approved",
//                 "bookings_created_at": "0000-00-00 00:00:00",
//                 "bookings_updated_at": "2023-10-19 09:14:35",
//                 "users_id": "1",
//                 "users_first_name": "Sunera",
//                 "users_last_name": "Perera",
//                 "users_email": "abhishekperera77@gmail.com",
//                 "users_phone": "0701273992",
//                 "users_profile_img": "abi.jpeg",
//                 "services_title": "Flutter Teacher",
//                 "services_description": "As a Flutter Teacher at SLIIT, you will play a pivotal role in training the next generation of mobile app developers. You will be responsible for teaching students how to build cross-platform mobile applications using Flutter, Google's UI toolkit for creating natively compiled applications for mobile, web, and desktop from a single codebase.",
//                 "services_location_id": "7",
//                 "services_rates": "2500.00",
//                 "services_image": "1_1696201204.jpg",
//                 "locations_id": "7",
//                 "locations_name": "Gampaha",
//                 "times_id": "2",
//                 "times_time": "01:00 am to 02:00 am",
//                 "booked_times": [
//                     {
//                         "times_id": "2",
//                         "times_time": "01:00 am to 02:00 am"
//                     },
//                     {
//                         "times_id": "3",
//                         "times_time": "02:00 am to 03:00 am"
//                     },
//                     {
//                         "times_id": "4",
//                         "times_time": "03:00 am to 04:00 am"
//                     }
//                 ]
//             },