import 'package:bvoat_clone/pages/data/product_repository.dart';
import 'package:bvoat_clone/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_color.dart';

class FashionTabBarView extends StatelessWidget {
  FashionTabBarView({Key? key, required this.terms}) : super(key: key);
  final Widget terms;
  final _getScrollController = Get.put(GetScrollController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Text(
            '가치소비 패션 추천',
            style: TextStyle(
              fontSize: Get.textTheme.headline6?.fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Text(
            '책임 있는 소비와 생산, 지속 가능한 패션 어때요?',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          _head(),
          DefaultTabController(
              length: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: Get.width,
                    color: const Color.fromARGB(221, 27, 24, 24),
                    child: TabBar(
                      isScrollable: true,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white,
                      labelStyle: Get.textTheme.bodyText2,
                      labelPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      indicatorColor: Colors.transparent,
                      tabs: const [
                        Tab(
                          text: '전체',
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          terms
        ],
      ),
    );
  }

  Widget _head() => Obx(() => Column(
        children: [
          SizedBox(
            height: 250,
            width: Get.width,
            child: ListView.builder(
              controller: _getScrollController.scrollController.value,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: ProductsRepository.loadProducts().length,
              itemBuilder: ((context, index) => ProductCard.noDescription(
                    ProductsRepository.loadProducts().elementAt(index),
                  )),
            ),
          ),
          LinearProgressIndicator(
            value: _getScrollController.offset.value,
            color: AppColor.instance.kBlue,
          ),
        ],
      ));
}

class GetScrollController extends GetxController {
  var scrollController = ScrollController(initialScrollOffset: 0.0).obs;
  var offset = 0.3.obs;

  @override
  void onInit() {
    scrollController.value.addListener(() {
      var maxOffset = scrollController.value.position.maxScrollExtent;
      var currentOffset = scrollController.value.offset;
      var offsetRatio = currentOffset / maxOffset;

      // if (offsetRatio < 0.3) {
      //   offsetRatio = 0.3;
      // } else if (offsetRatio < 0.6) {
      //   offsetRatio = 0.6;
      // } else {
      //   offsetRatio = 1;
      // }

      offset.value = offsetRatio < 0.3 ? 0.3 : offsetRatio;
    });
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.value.dispose();
    super.dispose();
  }
}
