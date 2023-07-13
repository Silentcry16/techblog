import 'package:flutter/material.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/view/profile_screen.dart';
import 'package:tech_blog/view/register_intro_.dart';
import 'package:tech_blog/widgets/custom_drawer.dart';

import '../widgets/btn_nav_bar.dart';
import 'home_screen.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  void handleIndexChanged(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
    // Perform any additional logic or actions based on the new index
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    double bodyMargin = size.width * 0.076;
    return Scaffold(
      key: _key,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: SolidColors.scaffoldBg,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  _key.currentState!.openDrawer();
                },
                icon: const Icon(Icons.list)),
            Image.asset(
              Assets.images.logo.path,
              height: size.height / 13.6,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
      ),
      drawer: CustomDrawer(size: size),
      // drawer: CustomDrawer(size: size),
      body: Stack(
        children: [
          IndexedStack(
            index: selectedIndex,
            children: [
              HomeScreen(size: size, bodyMargin: bodyMargin),
              ProfileScreen(size: size, bodyMargin: bodyMargin),
              RegisterIntro()
            ],
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: BtnNavBar(
              selectedIndex: selectedIndex,
              onIndexChanged: handleIndexChanged,
              size: size,
              bodyMargin: bodyMargin,
            ),
          )
        ],
      ),
    );
  }
}
