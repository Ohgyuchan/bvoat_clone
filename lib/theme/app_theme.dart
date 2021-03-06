import 'package:flutter/material.dart';

import 'app_color.dart';

class AppThemeData {
  AppThemeData._privateConstructor();
  static final AppThemeData _instance = AppThemeData._privateConstructor();
  static AppThemeData get instance => _instance;

  ThemeData light() => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          labelColor: AppColor.instance.kBlue,
          unselectedLabelColor: Colors.grey,
        ),
        indicatorColor: AppColor.instance.kBlue,
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedItemColor: AppColor.instance.kBlue,
          elevation: 10,
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.white,
          onPrimary: AppColor.instance.kBlue,
          secondary: Colors.green,
          onSecondary: Colors.orange,
          error: Colors.red,
          onError: Colors.grey,
          background: Colors.white,
          onBackground: AppColor.instance.kBlue,
          surface: AppColor.instance.kBlue, //bottom navigation
          onSurface: Colors.black,
        ),
      );
}
