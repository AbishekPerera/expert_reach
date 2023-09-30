import 'package:expert_reach/ui/common/addinquiryscreen/add_inquiry_screen.dart';
import 'package:expert_reach/ui/common/viewpostscreen/view_post_screen.dart';
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

  //common
  GetPage(name: "/view-post-screen", page: () => ViewPostScreen()),
  GetPage(name: "/add-inquiry-screen", page: () => AddInquiryScreen()),
];