import 'package:get/get.dart';
import 'package:expert_reach/ui/homescreen/home_screen.dart';
import 'package:expert_reach/ui/loginscreen/login_screen.dart';
import 'package:expert_reach/ui/registerphonescreen/register_screen.dart';
import 'package:expert_reach/ui/settingsscreen/settings.dart';
import 'package:expert_reach/ui/splashscreen/splashscreen.dart';

var appRoutes = [
  GetPage(name: "/", page: () => SplashScreen()),
  GetPage(name: "/login", page: () => LoginPage()),
  GetPage(name: "/register", page: () => RegisterScreen()),
  GetPage(name: "/home-screen", page: () => HomeScreen()),
  GetPage(name: "/settings", page: () => SettingsPage()),
];
