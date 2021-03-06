import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/views/screens/home/home_screen.dart';
import 'package:ecommerce_app/views/screens/cart/cart_screen.dart';
import 'package:ecommerce_app/provider/products_provider.dart';
import 'package:ecommerce_app/views/screens/feeds/feeds_screen.dart';
import 'package:ecommerce_app/views/screens/upload/upload_screen.dart';
import 'package:ecommerce_app/views/screens/search/search_screen.dart';
import 'package:ecommerce_app/views/screens/profile/profile_screen.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int _pageIndex = 0;

  List<Widget> tabScreens = [
    const HomeScreen(),
    const FeedsScreen(),
    const SearchScreen(),
    const CartScreen(),
    const UploadScreen(),
    const ProfileScreen(),
  ];

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.rss_feed), label: 'Feeds'),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag), label: 'Cart'),
    const BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'Upload'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final _productProvider = Provider.of<ProductsProvider>(context);
    _productProvider.fetchProducts();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: SizeConfig.defaultPadding),
          child: tabScreens[_pageIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (index) => setState(() => _pageIndex = index),
        items: items,
      ),
      // CupertinoTabBar(
      //   currentIndex: _pageIndex,
      //   onTap: (index) => setState(() => _pageIndex = index),
      //   backgroundColor: AppColors.white,
      //   activeColor: AppColors.spaceCadet,
      //   inactiveColor: AppColors.lightGrey,
      //   items: items,
      // ),
    );
  }
}
