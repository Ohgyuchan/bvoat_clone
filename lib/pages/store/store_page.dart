import 'package:flutter/material.dart';

import 'tab_bar_enum.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: TabBarEnum.values.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: TabBar(
            isScrollable: true,
            tabs: List.generate(
              TabBarEnum.values.length,
              (index) => TabBarEnum.values.elementAt(index).tabBarString,
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
