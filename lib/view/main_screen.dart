// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/view/profile_screen.dart';
import 'package:tech_blog/view/register_intro_.dart';
import 'package:tech_blog/widgets/custom_drawer.dart';

import '../components/my_colors.dart';
import '../widgets/btn_nav_bar.dart';
import 'home_screen.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  RxInt selectedIndex = 0.obs;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  MainScreen({super.key});
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
          //using Obx to reflect the changes on the screen
          Obx(
            () => IndexedStack(
              index: selectedIndex.value,
              children: [
                HomeScreen(size: size, bodyMargin: bodyMargin),
                ProfileScreen(size: size, bodyMargin: bodyMargin),
                const RegisterIntro()
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: BtnNavBar(
              selectedIndex: selectedIndex,
              size: size,
              bodyMargin: bodyMargin,
            ),
          )
        ],
      ),
    );
  }
}
