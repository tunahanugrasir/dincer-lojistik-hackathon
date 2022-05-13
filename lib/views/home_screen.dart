import 'package:flutter/material.dart';

import '../core/components/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {},
          icon: const Icon(
            Icons.format_align_left_outlined,
          ),
        ),
        title: Column(
          children: [
            const Text(
              'Mevcut adres',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            Row(
              children: [
                const Expanded(
                    child: Icon(
                  Icons.location_on_outlined,
                  color: Colors.black,
                )),
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Barış Mahallesi, Beylikdüzü',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
                Expanded(
                    child: IconButton(
                  onPressed: () {},
                  icon: (const Icon(Icons.keyboard_arrow_down_outlined)),
                  color: Colors.black,
                )),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
            color: Colors.black,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.departure_board_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyBottomAppBar(tabController: _tabController),
      body: MyTabBarViews(tabController: _tabController),
    );
  }
}
