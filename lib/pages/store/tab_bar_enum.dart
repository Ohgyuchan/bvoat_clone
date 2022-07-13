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
        return CrewTabBarView();
      case TabBarEnum.storeHome:
        return StoreHomeTabBarView();
      case TabBarEnum.fashion:
        return const FashionTabBarView();
      case TabBarEnum.food:
        return const FoodTabBarView();
      case TabBarEnum.beauty:
        return const BeautyTabBarView();
      case TabBarEnum.living:
        return const LivingTabBarView();
      case TabBarEnum.all:
        return const AllTabBarView();
      case TabBarEnum.funding:
        return const FundingTabBarView();
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
}
