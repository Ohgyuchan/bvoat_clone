import 'package:flutter/material.dart';

import 'tab_bar_enum.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: TabBarEnum.values.length,
      child: Scaffold(
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: TabBar(
              isScrollable: true,
              tabs: List.generate(
                TabBarEnum.values.length,
                (index) => TabBarEnum.values.elementAt(index).tabBarString,
              ),
            ),
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            TabBarEnum.values.length,
            (index) => TabBarEnum.values.elementAt(index).tabBarView,
          ),
        ),
      ),
    );
  }
}
