import 'package:flutter/material.dart';

import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/views/screens/auth/login_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: lightThemeMode,
      darkTheme: darkThemeMode,
      home: const LoginScreen(),
    );
  }
}
