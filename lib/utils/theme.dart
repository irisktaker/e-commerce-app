import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';

final darkThemeMode = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: AppColors.backgroundColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  iconTheme: const IconThemeData(
    color: AppColors.greyColor,
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
);

final lightThemeMode = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  iconTheme: const IconThemeData(
    color: AppColors.indyBlue,
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
);
