import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductController extends GetxController {
  var scrollController0 = ScrollController(initialScrollOffset: 0.0).obs;
  var scrollController1 = ScrollController(initialScrollOffset: 0.0).obs;
  var scrollController2 = ScrollController(initialScrollOffset: 0.0).obs;
  var scrollController3 = ScrollController(initialScrollOffset: 0.0).obs;
  var scrollController4 = ScrollController(initialScrollOffset: 0.0).obs;

  var offset0 = 0.3.obs;
  var offset1 = 0.3.obs;
  var offset2 = 0.3.obs;
  var offset3 = 0.3.obs;
  var offset4 = 0.3.obs;

  @override
  void onInit() {
    scrollController0.value.addListener(() {
      var maxOffset = scrollController0.value.position.maxScrollExtent;
      var currentOffset = scrollController0.value.offset;
      var offsetRatio = currentOffset / maxOffset;

      // if (offsetRatio < 0.3) {
      //   offsetRatio = 0.3;
      // } else if (offsetRatio < 0.6) {
      //   offsetRatio = 0.6;
      // } else {
      //   offsetRatio = 1;
      // }

      offset0.value = offsetRatio < 0.3 ? 0.3 : offsetRatio;
    });
    scrollController1.value.addListener(() {
      var maxOffset = scrollController1.value.position.maxScrollExtent;
      var currentOffset = scrollController1.value.offset;
      var offsetRatio = currentOffset / maxOffset;
      offset1.value = offsetRatio < 0.3 ? 0.3 : offsetRatio;
    });
    scrollController2.value.addListener(() {
      var maxOffset = scrollController2.value.position.maxScrollExtent;
      var currentOffset = scrollController2.value.offset;
      var offsetRatio = currentOffset / maxOffset;
      offset2.value = offsetRatio < 0.3 ? 0.3 : offsetRatio;
    });
    scrollController3.value.addListener(() {
      var maxOffset = scrollController3.value.position.maxScrollExtent;
      var currentOffset = scrollController3.value.offset;
      var offsetRatio = currentOffset / maxOffset;
      offset3.value = offsetRatio < 0.3 ? 0.3 : offsetRatio;
    });
    scrollController4.value.addListener(() {
      var maxOffset = scrollController4.value.position.maxScrollExtent;
      var currentOffset = scrollController4.value.offset;
      var offsetRatio = currentOffset / maxOffset;
      offset4.value = offsetRatio < 0.3 ? 0.3 : offsetRatio;
    });
    super.onInit();
  }
}
