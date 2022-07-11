import 'package:bvoat_clone/pages/data/product_model.dart';
import 'package:bvoat_clone/pages/data/product_repository.dart';
import 'package:bvoat_clone/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/data_utils.dart';
import 'tab_enum.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

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
        child: SingleChildScrollView(
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    tshirtsCards(),
                  ],
                ),
              ),
              terms(),
            ],
          ),
        ),
      ),
    );
  }

  Widget tshirtsCards() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '옷잘러들의 친환경🌱 그래PICK!',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '여름 흰티 + 그래픽은 치트키니까요 🤫',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w200,
            ),
          ),
          SizedBox(
            height: 500,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 150,
              ),
              itemCount: 10,
              itemBuilder: ((context, index) => productCard(
                  ProductsRepository.loadProducts().elementAt(index % 2))),
            ),
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
                  Text(
                    '9231명',
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
          Container(
            height: Get.height / 2.5,
            width: Get.width,
            color: Colors.grey,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            height: 10,
            width: 25,
            decoration: BoxDecoration(
                color: AppColor.instance.kBlue,
                borderRadius: BorderRadius.circular(15)),
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
