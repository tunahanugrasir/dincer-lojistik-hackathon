import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../core/components/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  bool _isSure = false;
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
        onPressed: () {
          setState(() {
            showDialog(
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return AlertDialog(
                        title: _isSure
                            ? AnimatedOpacity(
                                duration: const Duration(seconds: 2),
                                opacity: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Kargonuz size en yakın depoya yönlendiriliyor..',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(fontSize: 19, fontWeight: FontWeight.bold)),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: LottieBuilder.asset('assets/lottie_images/to_home_order.json'),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Text('Kargonuzu akıllı depolardan daha sonra almak istediğinize emin misiniz?',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(fontSize: 19, fontWeight: FontWeight.bold)),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isSure = true;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(const Color(0xff03045e)),
                                ),
                                child: const Text('Evet'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  _isSure = false;
                                },
                                child: const Text('Vazgeç', style: TextStyle(color: Color(0xff03045e))),
                              )
                            ],
                          )
                        ],
                      );
                    },
                  );
                },
                context: context);
          });
        },
        child: const Icon(Icons.departure_board_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyBottomAppBar(tabController: _tabController),
      body: MyTabBarViews(tabController: _tabController),
    );
  }
}
