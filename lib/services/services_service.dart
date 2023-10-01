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
}
