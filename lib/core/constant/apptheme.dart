import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color.dart';

ThemeData themeEnglish = ThemeData(
  cardColor: Colors.white,
  cardTheme: const CardTheme(
    color: Colors.white,
  ),
  useMaterial3: true,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor),
  scaffoldBackgroundColor: AppColor.backgroundColor,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: AppColor.primaryColor,
    foregroundColor: AppColor.backgroundColor,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.primaryColor,
        statusBarIconBrightness: Brightness.dark),
  ),
  textTheme:  const TextTheme(
    displayLarge: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black),
    displayMedium: TextStyle(
        fontSize: 25, fontWeight: FontWeight.bold, color: AppColor.black),
    bodyLarge: TextStyle(
        color: AppColor.backgroundColor,
        fontSize: 38,

        fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(
        height: 2,
        fontWeight: FontWeight.bold,
        color: AppColor.gray,
        fontSize: 14),
  ),
  primarySwatch: Colors.blue,
);

