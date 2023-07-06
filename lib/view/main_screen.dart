import 'package:flutter/material.dart';
import 'package:tech_blog/constant/my_colors.dart';

import '../widgets/btn_nav_bar.dart';
import '../widgets/custom_app_bar.dart';
import 'home_screen.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

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
          HomeScreen(size: size, bodyMargin: bodyMargin),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BtnNavBar(
              size: size,
              bodyMargin: bodyMargin,
            ),
          )
        ],
      ),
    );
  }
}
