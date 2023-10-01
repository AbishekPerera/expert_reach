import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expert_reach/controllers/settings/settings_controller.dart';
import 'package:expert_reach/routes/app_route.dart';
import 'package:expert_reach/utils/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      defaultTransition: Transition.rightToLeftWithFade,
      getPages: appRoutes,
      initialRoute: '/',
    );
  }
}

// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';

// // :::::::::::::::::::::::::::::::::::::::::::::::::::::Device Preview
// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => MyApp(), // Wrap your app
//       ),
//     );

// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//   final SettingsController settingsController = Get.put(SettingsController());

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       useInheritedMediaQuery: true,
//       locale: DevicePreview.locale(context),
//       builder: DevicePreview.appBuilder,

//       getPages: appRoutes,
//       // theme data
//       theme: AppTheme.lightTheme,
//       darkTheme: AppTheme.darkTheme,
//       themeMode: ThemeMode.system,
//       defaultTransition: Transition.rightToLeftWithFade,
//     );
//   }
// }
