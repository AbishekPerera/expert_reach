import 'dart:convert';

import 'package:expert_reach/constants/api_endpoint.dart';
import 'package:expert_reach/services/session_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ServicesService extends SessionService {
  Future<dynamic> getLocations() async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {"name": "getLocations", "param": {}};

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }

  Future<dynamic> addService(String serviceTitle, String serviceDescription,
      String locationId, String servicePrice, String base64image) async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "addService",
          "param": {
            "title": serviceTitle,
            "description": serviceDescription,
            "location_id": locationId,
            "rates": servicePrice,
            "image": base64image
          }
        };

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }

  //getServicesByUserId
  Future<dynamic> getServicesByUserId() async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "getServicesByUserId",
          "param": {}
        };

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }

  //getRateAndReviewsByServiceId
  Future<dynamic> getRateAndReviewsByServiceId(String serviceId) async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "getRateAndReviewsByServiceId",
          "param": {
            "service_id": serviceId,
          }
        };

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }

//getAllServices
  Future<dynamic> getAllServices() async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "getAllServices",
          "param": {}
        };

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }

  //getSuggestedServices
  Future<dynamic> getSuggestedServices() async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "getSuggestedServices",
          "param": {}
        };

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }

  //updateService

  Future<dynamic> updateService(
      String id,
      String serviceTitle,
      String serviceDescription,
      String locationId,
      String servicePrice,
      String base64image) async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "updateService",
          "param": {
            "service_id": id,
            "title": serviceTitle,
            "description": serviceDescription,
            "location_id": locationId,
            "rates": servicePrice,
            "image": base64image
          }
        };

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }

  Future<dynamic> deleteService(String id) async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "deleteService",
          "param": {
            "service_id": id,
          }
        };

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }

  //get times
  Future<dynamic> getTimes(String serviceProviderId, String date) async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "getTimes",
          "param": {
            "service_provider_id": serviceProviderId,
            "date": date,
          }
        };

        // print(json);
        // return;

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }

  Future<dynamic> addBooking(String serviceProviderId, String serviceId,
      String date, String timeFrom, String notes) async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "addBooking",
          "param": {
            "service_provider_id": serviceProviderId,
            "service_id": serviceId,
            "date": date,
            "time_from": timeFrom,
            "notes": notes
          }
        };

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }

  Future<dynamic> getBookingsByUserId() async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "getBookingsByUserId",
          "param": {}
        };

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }

  Future<dynamic> deleteBooking(String id) async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "deleteBooking",
          "param": {
            "booking_id": id,
          }
        };

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }

  // getBookingsByServiceProviderId
  Future<dynamic> getBookingsByServiceProviderId() async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "getBookingsByServiceProviderId",
          "param": {}
        };

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }

  Future<dynamic> updateBookingStatus(String id, String status) async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "updateBookingStatus",
          "param": {
            "booking_id": id,
            "status": status,
          }
        };

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }

  Future<dynamic> getRateAndReviewByUserIdAndServiceId(String id) async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "getRateAndReviewByUserIdAndServiceId",
          "param": {
            "service_id": id,
          }
        };

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }

  Future<dynamic> addUpdateRateAndReviewByUserIdAndServiceId(
      String service_id, String rating, String review) async {
    // print(service_id);
    // print(rating);
    // print(review);

    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "addUpdateRateAndReviewByUserIdAndServiceId",
          "param": {
            "service_id": service_id,
            "feedback": review,
            "stars": rating
          }
        };

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }

  Future<dynamic> getSearchTermsByUserId() async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "getSearchTermsByUserId",
          "param": {}
        };

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }

  Future<dynamic> addSearchTerms(String text) async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "addSearchTerms",
          "param": {
            "search_terms": text,
          }
        };

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }

  Future<dynamic> adminLogin(String userName, String password) async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      // print(headers);
      final Map<String, dynamic> json = {
        "name": "adminLogin",
        "param": {
          "email": userName,
          "password": password,
        }
      };

      final response = await http.post(Uri.parse(baseURL),
          headers: headers, body: jsonEncode(json));

      final responseData = jsonDecode(response.body);

      return responseData;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  Future<dynamic> updateServiceStatus(
      String serviceId, String userId, String status) async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      // print(headers);
      final Map<String, dynamic> json = {
        "name": "updateServiceStatus",
        "param": {"service_id": serviceId, "user_id": userId, "status": status}
      };

      final response = await http.post(Uri.parse(baseURL),
          headers: headers, body: jsonEncode(json));

      final responseData = jsonDecode(response.body);

      return responseData;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  //getAllServices
  Future<dynamic> getAllServicesAdmin() async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "getAllServicesAdmin",
          "param": {}
        };

        final response = await http.post(Uri.parse(baseURL),
            headers: headers, body: jsonEncode(json));

        final responseData = jsonDecode(response.body);

        return responseData;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    } else {
      return null;
    }
  }
}
