import 'package:flutter/material.dart';
import 'package:flutter_app/pages/custom_splashscreen.dart';
import 'package:flutter_app/pages/homepage.dart';
import 'package:flutter_app/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        "splash": (context) => CustomSplashScreen(),
        "login": (context) => LoginPage(),
        "home": (context) => HomePage()
      },
    );
  }
}
