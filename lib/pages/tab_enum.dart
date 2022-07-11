import 'package:flutter/material.dart';

enum TabEnum {
  crew,
  storeHome,
  fashion,
  food,
  beauty,
  living,
  all,
  funding,
}

List<Widget> get tabBars {
  List<Widget> items = [];
  for (var element in TabEnum.values) {
    items.add(Container(child: Text(element.name)));
  }
  return items;
}

// extension TabEumExtension on TabEnum {
//   String get tabName {
//     switch (this) {
//       case TabEnum.crew:
//         return const FeedPage();
//       case TabEnum.category:
//         return const CategoryPage();
//       case TabEnum.store:
//         return const StorePage();
//       case TabEnum.favorite:
//         return const FavoritePage();
//       case TabEnum.sign:
//         return const SignPage();
//       default:
//         return '';
//     }
//   }
// }
