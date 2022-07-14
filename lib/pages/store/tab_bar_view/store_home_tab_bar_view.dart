import 'package:countup/countup.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_color.dart';
import '../../../widgets/product_card.dart';
import '../../data/product_model.dart';
import '../../data/product_repository.dart';
import '../product_controller.dart';

class StoreHomeTabBarView extends StatelessWidget {
  StoreHomeTabBarView({Key? key, required this.terms}) : super(key: key);
  final _productController = Get.put(ProductController());
  final Widget terms;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            adCard(),
            trackingCard(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
              child: Column(
                children: [
                  tshirtsCards(
                    '옷잘러들의 친환경🌱 그래PICK!',
                    '여름 흰티 + 그래픽은 치트키니까요 🤫',
                    ProductsRepository.loadProducts().getRange(0, 2).toList(),
                    _productController.scrollController0.value,
                    _productController.offset0.value,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
              child: Column(
                children: [
                  tshirtsCards(
                    '🧐 이 브랜드, 이 상품이 친환경?',
                    '이제 브랜드도 친환경이 대세입니다.',
                    ProductsRepository.loadProducts().getRange(2, 4).toList(),
                    _productController.scrollController1.value,
                    _productController.offset1.value,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
              child: Column(
                children: [
                  tshirtsCards(
                    '상상도 못한 소재 (Feat.환경을 위하여 👍)',
                    '신기한 소재로 업사이클링 된 상품만 모았어요',
                    ProductsRepository.loadProducts().getRange(4, 6).toList(),
                    _productController.scrollController2.value,
                    _productController.offset2.value,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
              child: Column(
                children: [
                  tshirtsCards(
                    '새 신을 신고 뛰어보자 팔짝! 👟',
                    '이번 여름은 환경과 함께하는 스니커즈 어때요?',
                    ProductsRepository.loadProducts().getRange(9, 11).toList(),
                    _productController.scrollController4.value,
                    _productController.offset4.value,
                  ),
                ],
              ),
            ),
            terms,
          ],
        ),
      ),
    );
  }

  Widget tshirtsCards(
          String title,
          String subTitle,
          List<ProductModel> productModels,
          ScrollController scrollController,
          double offset) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subTitle,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w200,
            ),
          ),
          SizedBox(
              height: 500,
              child: GridView.builder(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 160,
                ),
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return ProductCard.build(
                    productModels.elementAt(index % 2),
                  );
                }),
              )),
          LinearProgressIndicator(
            value: offset,
            color: AppColor.instance.kBlue,
          ),
        ],
      );

  Widget trackingCard() => Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        color: Colors.grey[100],
        height: 80,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('먹고, 입고, 쓰는 친환경 가치소비'),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '👀 ',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Countup(
                    begin: 0,
                    end: 9231,
                    separator: ',',
                    duration: const Duration(seconds: 1),
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColor.instance.kBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '명',
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColor.instance.kBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    '이 함께하고 있어요!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget adCard() => Column(
        children: [
          SizedBox(
            height: Get.height / 2.5,
            width: Get.width,
            child: Image.asset(
              'assets/ad.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            height: 10,
            width: 20,
            decoration: BoxDecoration(
                color: AppColor.instance.kBlue,
                borderRadius: BorderRadius.circular(25)),
          ),
        ],
      );
}
