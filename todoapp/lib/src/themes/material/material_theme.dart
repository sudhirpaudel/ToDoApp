import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:todoapp/config/constants/app_color.dart';

final materialAppTheme = MaterialAppData(
  debugShowCheckedModeBanner: false,
  themeMode: ThemeMode.light,
  theme: ThemeData(
    platform: TargetPlatform.android,
    useMaterial3: true,
    fontFamily: 'RobotoMono',
    textTheme: const TextTheme(
      headline6: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      headline2: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: lightPrimaryColor,
      ),
      headline3: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
      headline4: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      headline5: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
      subtitle1: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: lightTextColor,
      ),
      subtitle2: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: darkTextColor,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: lightTextColor,
      ),
       
    ),
    backgroundColor: backgroundColor,
    scaffoldBackgroundColor: backgroundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: secondaryColor,
      foregroundColor: primaryColor,
      splashColor: lightPrimaryColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      actionsIconTheme: IconThemeData(color: primaryTextColor),
      iconTheme: IconThemeData(color: primaryTextColor),
      titleTextStyle: TextStyle(
        color: primaryTextColor,
        fontFamily: 'RobotoMono',
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    primaryColor: primaryColor,
  ),
);
