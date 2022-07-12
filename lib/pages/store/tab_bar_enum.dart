import 'package:bvoat_clone/pages/store/tab_bar_view/all_tab_bar_view.dart';
import 'package:bvoat_clone/pages/store/tab_bar_view/beauty_tab_bar_view.dart';
import 'package:bvoat_clone/pages/store/tab_bar_view/crew_tab_bar_view.dart';
import 'package:bvoat_clone/pages/store/tab_bar_view/fashion_tab_bar_view.dart';
import 'package:bvoat_clone/pages/store/tab_bar_view/food_tab_bar_view.dart';
import 'package:bvoat_clone/pages/store/tab_bar_view/funding_tab_bar_view.dart';
import 'package:bvoat_clone/pages/store/tab_bar_view/living_tab_bar_view.dart';
import 'package:bvoat_clone/pages/store/tab_bar_view/store_home_tab_bar_view.dart';
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
        return const CrewTabBarView();
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
}
