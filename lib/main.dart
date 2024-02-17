import 'package:krncheck/pages/loginpage.dart';
import 'package:krncheck/pages/registerpage.dart';
import 'package:krncheck/pages/splash_screen.dart';
import 'package:krncheck/widgets/themes.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'utilis/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: Mytheme.lighttheme(context),
      darkTheme: Mytheme.darktheme(context),
      debugShowCheckedModeBanner: false,
      // initialRoute: MyRoutes.homeroute,
      routes:{
        "/":(context) => HomePage(),
        MyRoutes.splashroute:(context) => SplashScreen(),
        MyRoutes.loginroute:(context) =>Loginpage(),
        MyRoutes.homeroute :(context) =>HomePage(),
        // MyRoutes.homeroute :(context) =>homepage(),
        MyRoutes.Registerroute :(context) =>RegisterPage(),
      },
    );
  }
}
