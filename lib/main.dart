import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/provider/orders_provider.dart';
import 'package:ecommerce_app/views/details/details_page.dart';
import 'package:ecommerce_app/provider/products_provider.dart';
import 'package:ecommerce_app/views/screens/bottom_nva_bar.dart';
import 'package:ecommerce_app/views/screens/auth/login_screen.dart';
import 'package:ecommerce_app/views/screens/order/order_screen.dart';
import 'package:ecommerce_app/views/screens/feeds/feeds_category_screen.dart';

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
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrdersProvider()),
      ],
      child: MaterialApp(
        title: 'E-Commerce',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: lightThemeMode,
        darkTheme: darkThemeMode,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (userSnapshot.connectionState == ConnectionState.active) {
              if (userSnapshot.hasData) {
                return const MainBottomNavBar();
              } else {
                return const LoginScreen();
              }
            } else if (userSnapshot.hasError) {
              return const Center(child: Text("something went wrong"));
            }
            return Container();
          },
        ),
        routes: {
          DetailPage.id: (context) => const DetailPage(),
          FeedsCategoryScreen.id: (context) => const FeedsCategoryScreen(),
          OrderScreen.id: (context) => const OrderScreen(),
        },
      ),
    );
  }
}
