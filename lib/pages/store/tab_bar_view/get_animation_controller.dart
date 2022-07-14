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

  goLastOffset() async {
    await scrollController.value.animateTo(
      scrollController.value.position.maxScrollExtent,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.fastOutSlowIn,
    );
  }

  goInitialOffset() async {
    await scrollController.value.animateTo(
      scrollController.value.initialScrollOffset,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    scrollController.value.dispose();
    super.dispose();
  }
}
