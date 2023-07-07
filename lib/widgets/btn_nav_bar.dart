import 'package:flutter/material.dart';
import 'package:tech_blog/view/home_screen.dart';
import 'package:tech_blog/view/profile_screen.dart';

import '../constant/my_colors.dart';
import '../gen/assets.gen.dart';

class BtnNavBar extends StatelessWidget {
  const BtnNavBar({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 10,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: GradientColors.bottomNavBackground,
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: bodyMargin),
        child: Container(
          height: size.height / 12,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(18),
            gradient: const LinearGradient(
              colors: GradientColors.bottomNav,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      AssetImage(Assets.icons.home.path),
                      color: SolidColors.lightIcon,
                    )),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      AssetImage(Assets.icons.write.path),
                      color: SolidColors.lightIcon,
                    )),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      AssetImage(Assets.icons.user.path),
                      color: SolidColors.lightIcon,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
