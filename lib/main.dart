import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/theme/theme_helper.dart';
import 'package:login/routes/app_routes.dart';
import 'package:login/core/utils/size_utils.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'login',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.loginPageScreen,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
