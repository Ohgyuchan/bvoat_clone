import 'package:flutter/material.dart';

import '../auth/sign_page.dart';
import '../category_page.dart';
import '../favorite_page.dart';
import '../feed_page.dart';
import '../store/store_page.dart';

enum HomeEnum {
  feed,
  category,
  store,
  favorite,
  sign,
}

extension HomeEnumExtention on HomeEnum {
  Widget get page {
    switch (this) {
      case HomeEnum.feed:
        return const FeedPage();
      case HomeEnum.category:
        return const CategoryPage();
      case HomeEnum.store:
        return const StorePage();
      case HomeEnum.favorite:
        return const FavoritePage();
      case HomeEnum.sign:
        return const SignPage();
      default:
        return Container();
    }
  }

  BottomNavigationBarItem get bottomNavigationItem {
    switch (this) {
      case HomeEnum.feed:
        return BottomNavigationBarItem(
          label: getString,
          icon: const Icon(Icons.public),
        );
      case HomeEnum.category:
        return BottomNavigationBarItem(
          label: getString,
          icon: const Icon(Icons.dashboard),
        );
      case HomeEnum.store:
        return BottomNavigationBarItem(
          label: getString,
          icon: const Icon(Icons.storefront),
        );
      case HomeEnum.favorite:
        return BottomNavigationBarItem(
          label: getString,
          icon: const Icon(Icons.favorite),
        );
      case HomeEnum.sign:
        return BottomNavigationBarItem(
          label: getString,
          icon: const Icon(Icons.person),
        );
      default:
        return const BottomNavigationBarItem(
          icon: Icon(Icons.abc),
        );
    }
  }

  String get getString {
    switch (this) {
      case HomeEnum.feed:
        return '피드';
      case HomeEnum.category:
        return '카테고리';
      case HomeEnum.store:
        return '스토어';
      case HomeEnum.favorite:
        return '찜';
      case HomeEnum.sign:
        return '로그인';
      default:
        return '';
    }
  }
}
