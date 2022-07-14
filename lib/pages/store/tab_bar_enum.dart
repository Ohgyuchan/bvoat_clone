import 'package:bvoat_clone/pages/store/tab_bar_view/all_tab_bar_view.dart';
import 'package:bvoat_clone/pages/store/tab_bar_view/beauty_tab_bar_view.dart';
import 'package:bvoat_clone/pages/store/tab_bar_view/crew_tab_bar_view.dart';
import 'package:bvoat_clone/pages/store/tab_bar_view/fashion_tab_bar_view.dart';
import 'package:bvoat_clone/pages/store/tab_bar_view/food_tab_bar_view.dart';
import 'package:bvoat_clone/pages/store/tab_bar_view/funding_tab_bar_view.dart';
import 'package:bvoat_clone/pages/store/tab_bar_view/living_tab_bar_view.dart';
import 'package:bvoat_clone/pages/store/tab_bar_view/store_home_tab_bar_view.dart';
import 'package:bvoat_clone/theme/app_color.dart';
import 'package:flutter/material.dart';

enum TabBarEnum {
  crew,
  storeHome,
  fashion,
  food,
  beauty,
  living,
  all,
  funding,
}

extension TabBarEumExtension on TabBarEnum {
  Widget get tabBarView {
    switch (this) {
      case TabBarEnum.crew:
        return CrewTabBarView(terms: terms);
      case TabBarEnum.storeHome:
        return StoreHomeTabBarView(terms: terms);
      case TabBarEnum.fashion:
        return FashionTabBarView(terms: terms);
      case TabBarEnum.food:
        return FoodTabBarView(terms: terms);
      case TabBarEnum.beauty:
        return BeautyTabBarView(terms: terms);
      case TabBarEnum.living:
        return LivingTabBarView(terms: terms);
      case TabBarEnum.all:
        return AllTabBarView(terms: terms);
      case TabBarEnum.funding:
        return FundingTabBarView(terms: terms);
      default:
        return Container();
    }
  }

  Widget get tabBarString {
    switch (this) {
      case TabBarEnum.crew:
        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              child: Text(
                '크루 가입',
                style: TextStyle(color: AppColor.instance.kBlue),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                    color: AppColor.instance.kBlue,
                    borderRadius: BorderRadius.circular(35)),
              ),
            ),
          ],
        );
      case TabBarEnum.storeHome:
        return Text('스토어 홈');
      case TabBarEnum.fashion:
        return Text('패션');
      case TabBarEnum.food:
        return Text('식품');
      case TabBarEnum.beauty:
        return Text('뷰티');
      case TabBarEnum.living:
        return Text('리빙');
      case TabBarEnum.all:
        return Text('All');
      case TabBarEnum.funding:
        return Text('펀딩·공구');
      default:
        return Text('');
    }
  }

  Widget get terms => Column(
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
