import 'package:flutter/material.dart';

class AppColor {
  AppColor._privateConstructor();
  static final AppColor _instance = AppColor._privateConstructor();

  static AppColor get instance => _instance;

  final kBlue = const Color.fromARGB(255, 2, 13, 230);
}
