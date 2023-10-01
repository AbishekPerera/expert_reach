import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  late SharedPreferences prefs;
  bool isLogin = false;

  String? token;
  String? email;
  String? first_name;
  String? last_name;
  String? phone;
  String? profile_img;
  String? expirationDate;

  // Initialize service and validate login
  Future<void> initService() async {
    if (kDebugMode) {
      print("initService Called");
    }
    isLogin = await validateLogin();
  }

  // Validate login
  Future<bool> validateLogin() async {
    try {
      prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      email = prefs.getString('email');
      first_name = prefs.getString('first_name');
      last_name = prefs.getString('last_name');
      phone = prefs.getString('phone');
      profile_img = prefs.getString('profile_img');
      expirationDate = prefs.getString('expirationDate');

      return token != null;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }
}
