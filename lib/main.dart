import 'package:flutter/material.dart';
import 'package:pintarshop_app/screens/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const ThemeMode _themeMode = ThemeMode.light;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POS PINTAR',
      themeMode: _themeMode,
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.red),
      darkTheme:
          ThemeData(primarySwatch: Colors.brown, primaryColor: Colors.green),
      home: const SplashPage(),
    );
  }
}
