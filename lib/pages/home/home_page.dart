import 'package:bvoat_clone/pages/home/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_enum.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.put(HomePageController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: homePageController.selectedHomeEnum.value.index,
          onTap: homePageController.onTap,
          items: List.generate(
            HomeEnum.values.length,
            (index) => HomeEnum.values.elementAt(index).bottomNavigationItem,
          ),
        ),
      ),
      body: Obx(
        (() => Center(child: homePageController.selectedHomeEnum.value.page)),
      ),
    );
  }
}
