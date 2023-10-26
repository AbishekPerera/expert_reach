import 'dart:convert';

import 'package:expert_reach/constants/api_endpoint.dart';
import 'package:expert_reach/services/session_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NotificationService extends SessionService {
  Future<dynamic> getNotificationsByUserId() async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "getNotificationsByUserId",
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

  Future<dynamic> seenNotification(String id) async {
    if (isLogin) {
      try {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // print(headers);
        final Map<String, dynamic> json = {
          "name": "seenNotification",
          "param": {"notification_id": id}
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
