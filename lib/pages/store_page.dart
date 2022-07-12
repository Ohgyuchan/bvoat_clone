import 'package:bvoat_clone/pages/data/product_model.dart';
import 'package:bvoat_clone/pages/data/product_repository.dart';
import 'package:bvoat_clone/theme/app_color.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/data_utils.dart';
import 'tab_enum.dart';

class StorePage extends StatelessWidget {
  StorePage({Key? key}) : super(key: key);
  final _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bvoat'),
          leading: IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
          ],
        ),
        body: DefaultTabController(
          initialIndex: 1,
          length: TabEnum.values.length,
          child: Obx(
            () => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                    isScrollable: true,
                    tabs: List.generate(
                      TabEnum.values.length,
                      (index) => Text(TabEnum.values.elementAt(index).name),
                    ),
                  ),
                  adCard(),
                  trackingCard(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
                    child: Column(
                      children: [
                        tshirtsCards(
                          '옷잘러들의 친환경🌱 그래PICK!',
                          '여름 흰티 + 그래픽은 치트키니까요 🤫',
                          ProductsRepository.loadProducts()
                              .getRange(0, 2)
                              .toList(),
                          _productController.scrollController0.value,
                          _productController.offset0.value,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
                    child: Column(
                      children: [
                        tshirtsCards(
                          '🧐 이 브랜드, 이 상품이 친환경?',
                          '이제 브랜드도 친환경이 대세입니다.',
                          ProductsRepository.loadProducts()
                              .getRange(2, 4)
                              .toList(),
                          _productController.scrollController1.value,
                          _productController.offset1.value,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
                    child: Column(
                      children: [
                        tshirtsCards(
                          '상상도 못한 소재 (Feat.환경을 위하여 👍)',
                          '신기한 소재로 업사이클링 된 상품만 모았어요',
                          ProductsRepository.loadProducts()
                              .getRange(4, 6)
                              .toList(),
                          _productController.scrollController2.value,
                          _productController.offset2.value,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
                    child: Column(
                      children: [
                        tshirtsCards(
                          '새 신을 신고 뛰어보자 팔짝! 👟',
                          '이번 여름은 환경과 함께하는 스니커즈 어때요?',
                          ProductsRepository.loadProducts()
                              .getRange(9, 11)
                              .toList(),
                          _productController.scrollController4.value,
                          _productController.offset4.value,
                        ),
                      ],
                    ),
                  ),
                  terms(),
                ],
              ),
            ),
          ),
        ));
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
                  return productCard(
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

  Widget productCard(ProductModel productModel) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Image.asset(
              productModel.getAssetName,
              width: 150,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.brand,
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
                Text(
                  productModel.description,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis),
                ),
                Text(
                  productModel.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  DataUtils.calcStringToWon(productModel.price),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
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

  Widget terms() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text('개인정보처리방침'),
                SizedBox(width: 8),
                Text('이용약관'),
                SizedBox(width: 8),
                Text('환불 정책'),
                SizedBox(width: 8),
                Text('파트너쉽/입점 문의'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('소비는 투표다!'),
                Row(
                  children: const [
                    Text('가치소비 커뮤니티 커머스 - '),
                    Text(
                      '비보트',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                  padding: const EdgeInsets.all(5),
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: const [
                      Text('Download on the'),
                      Text('App Store'),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: const [
                      Text('Download on the'),
                      Text('Google Play'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '제휴문의: official@____.kr',
                  style: TextStyle(fontSize: 11),
                ),
                Text(
                  '고객센터: 080-0123-1234 / 카카오톡 채널: 비보트 (운영시간 | 평일 13:00~18:00)',
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  '(주) 패신저스 사업자 정보',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.expand_more,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('주식회사 패신저스 | 대표 : 아무개'),
                Text('주소 : 12345 포항시 북구 흥해읍 흥해라 흥'),
                Text('사업자등록번호 : 123-12-12345'),
                Text('통신판매업신고번호 : 2021-흥해-12345'),
                Text('개인정보관리책임자 : 김관리 operator@_____.kr'),
              ],
            ),
          ),
        ],
      );
}

class ProductController extends GetxController {
  var scrollController0 = ScrollController(initialScrollOffset: 0.0).obs;
  var scrollController1 = ScrollController(initialScrollOffset: 0.0).obs;
  var scrollController2 = ScrollController(initialScrollOffset: 0.0).obs;
  var scrollController3 = ScrollController(initialScrollOffset: 0.0).obs;
  var scrollController4 = ScrollController(initialScrollOffset: 0.0).obs;

  var offset0 = 0.0.obs;
  var offset1 = 0.0.obs;
  var offset2 = 0.0.obs;
  var offset3 = 0.0.obs;
  var offset4 = 0.0.obs;

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

      offset0.value = offsetRatio;
    });
    scrollController1.value.addListener(() {
      var maxOffset = scrollController1.value.position.maxScrollExtent;
      var currentOffset = scrollController1.value.offset;
      var offsetRatio = currentOffset / maxOffset;
      offset1.value = offsetRatio;
    });
    scrollController2.value.addListener(() {
      var maxOffset = scrollController2.value.position.maxScrollExtent;
      var currentOffset = scrollController2.value.offset;
      var offsetRatio = currentOffset / maxOffset;
      offset2.value = offsetRatio;
    });
    scrollController3.value.addListener(() {
      var maxOffset = scrollController3.value.position.maxScrollExtent;
      var currentOffset = scrollController3.value.offset;
      var offsetRatio = currentOffset / maxOffset;
      offset3.value = offsetRatio;
    });
    scrollController4.value.addListener(() {
      var maxOffset = scrollController4.value.position.maxScrollExtent;
      var currentOffset = scrollController4.value.offset;
      var offsetRatio = currentOffset / maxOffset;
      offset4.value = offsetRatio;
    });
    super.onInit();
  }
}
