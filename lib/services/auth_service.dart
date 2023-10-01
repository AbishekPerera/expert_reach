import 'dart:convert';
import 'package:expert_reach/constants/api_endpoint.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // sign in with userName and password
  Future Login(String email, String password) async {
    try {
      final Map<String, String> headers = {'Content-Type': 'application/json'};

      final Map<String, dynamic> json = {
        "name": "generateToken",
        "param": {"email": email, "password": password}
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
