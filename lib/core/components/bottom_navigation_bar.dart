import 'package:deneme/views/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../views/home_screen_base_view.dart';
import '../../views/return_view.dart';
import '../../views/smartbox_view.dart';

class MyTabBarViews extends StatelessWidget {
  const MyTabBarViews({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        controller: _tabController,
        children: const [HomeScreenBaseView(), ReturnView(), SmartBoxView(), ProfileScreenView()]);
  }
}

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        notchMargin: 10,
        shape: const CircularNotchedRectangle(),
        child: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home_outlined)),
            Padding(padding: EdgeInsets.only(right: 40), child: Tab(icon: Icon(Icons.shopping_bag_outlined))),
            Padding(padding: EdgeInsets.only(left: 40), child: Tab(icon: Icon(Icons.info_outline))),
            Tab(icon: Icon(Icons.person_outline)),
          ],
        ));
  }
}
