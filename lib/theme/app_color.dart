import 'package:flutter/material.dart';

class AppColor {
  AppColor._privateConstructor();
  static final AppColor _instance = AppColor._privateConstructor();

  static AppColor get instance => _instance;

  final kBlue = Color.fromARGB(255, 5, 17, 239);
  final kBlueBlur = Color.fromARGB(255, 64, 70, 185);
}
