import 'package:flutter/material.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/view/profile_screen.dart';
import 'package:tech_blog/view/register_intro_.dart';

import '../widgets/btn_nav_bar.dart';
import '../widgets/custom_app_bar.dart';
import 'home_screen.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: SolidColors.scaffoldBg,
        title: CustomAppBar(size: size),
      ),
      body: Stack(
        children: [
          // HomeScreen(size: size, bodyMargin: bodyMargin),

          IndexedStack(
            index: selectedIndex,
            children: [
              HomeScreen(size: size, bodyMargin: bodyMargin),
              ProfileScreen(size: size, bodyMargin: bodyMargin),
              RegisterIntro()
            ],
          ),
          Positioned(
            bottom: 0,
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
