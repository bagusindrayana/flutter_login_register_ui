import 'package:flutter/material.dart';
import 'package:login_page/page/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const MaterialColor primaryColorShades = MaterialColor(
      0xFFFF6363,
      <int, Color>{
        50: Color(0xFFA4A4BF),
        100: Color(0xFFA4A4BF),
        200: Color(0xFFA4A4BF),
        300: Color(0xFF9191B3),
        400: Color(0xFF7F7FA6),
        500: Color(0xFFFF6363),
        600: Color(0xFF6D6D99),
        700: Color(0xFF5B5B8D),
        800: Color(0xFF494980),
        900: Color(0xFFFF6363),
      },
    );
    return MaterialApp(
      title: 'Login And Register Page',
      theme: ThemeData(
        primarySwatch: primaryColorShades,
      ),
      home: const SplashPage(),
    );
  }
}

