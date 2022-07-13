import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetAnimationController extends GetxController {
  var scrollController = ScrollController().obs;
  var first = false.obs;
  var second = false.obs;
  var third = false.obs;
  var forth = false.obs;
  var fifth = false.obs;

  @override
  void onInit() {
    scrollController.value.addListener(() {});
    super.onInit();
  }
}
