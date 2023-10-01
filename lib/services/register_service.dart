import 'dart:convert';

import 'package:expert_reach/constants/api_endpoint.dart';
import 'package:flutter/foundation.dart';

import 'session_service.dart';
import 'package:http/http.dart' as http;

class RegisterService extends SessionService {
  Future<dynamic> registerUser(String firstName, String lastName, String email,
      String phone, String password, String profileImg) async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      // print(headers);
      final Map<String, dynamic> json = {
        "name": "registerUser",
        "param": {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "phone": phone,
          "password": password,
          "profile_img": profileImg
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
}
