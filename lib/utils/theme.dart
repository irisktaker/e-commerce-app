import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';

//... DARK MODE
final darkThemeMode = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: AppColors.backgroundColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  canvasColor: AppColors.backgroundColor,
  primaryColor: Colors.white,
  iconTheme: const IconThemeData(
    color: AppColors.white,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: AppColors.greyColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 56),
      primary: AppColors.buttonColor,
      onPrimary: AppColors.greyColor2,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        /* 
            padding: ...,
            textStyle: ...,
            ... 
            */
        ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.backgroundColor,
    selectedItemColor: AppColors.spaceLight,
    unselectedItemColor: AppColors.greyColor,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundColor,
    foregroundColor: AppColors.white,
    elevation: 0,
    centerTitle: true,
  ),
);

//... LIGHT MODE
final lightThemeMode = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: Colors.black,
  primaryColorLight: Colors.black,
  canvasColor: AppColors.white,
  // primaryColorDark: Colors.white,

  iconTheme: const IconThemeData(
    color: AppColors.black,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: AppColors.indyBlue,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 56),
      primary: AppColors.orangeWeb,
      onPrimary: AppColors.indyBlue,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        /* 
            padding: ...,
            textStyle: ...,
            ... 
            */
        ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.white,
    selectedItemColor: AppColors.spaceCadet,
    unselectedItemColor: AppColors.indyBlue,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.white,
    foregroundColor: AppColors.indyBlue,
    elevation: 0,
    centerTitle: true,
  ),
);
