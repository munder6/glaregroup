import 'package:flutter/material.dart';
import 'color.dart';

ThemeData themeEnglish = ThemeData(
  appBarTheme: const AppBarTheme(
    color: AppColor.primaryColor
  ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor
    ),
    fontFamily: "Alexandria",
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14, color: AppColor.grey),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26, color: AppColor.black),
      bodyLarge:TextStyle(
          height: 1.5,
          color: AppColor.grey,
          //fontWeight: FontWeight.w300,
          fontSize: 15),
    )
);


ThemeData themeArabic = ThemeData(
    appBarTheme: const AppBarTheme(
        color: AppColor.primaryColor
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor
    ),
    fontFamily: "Alexandria",
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12, color: AppColor.grey),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20, color: AppColor.black),
      bodyLarge:TextStyle(
          height: 1.5,
          color: AppColor.grey,
          //fontWeight: FontWeight.w300,
          fontSize: 15),
    )
);