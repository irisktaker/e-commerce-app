import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/provider/products_provider.dart';
import 'package:ecommerce_app/views/screens/bottom_nva_bar.dart';
import 'package:ecommerce_app/views/screens/auth/login_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'E-Commerce',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: lightThemeMode,
        darkTheme: darkThemeMode,
        // home: const LoginScreen(),
        home: const MainBottomNavBar(),
      ),
    );
  }
}
