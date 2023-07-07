import 'package:flutter/material.dart';
import 'package:tech_blog/view/home_screen.dart';
import 'package:tech_blog/view/profile_screen.dart';

import '../constant/my_colors.dart';
import '../gen/assets.gen.dart';

class BtnNavBar extends StatefulWidget {
  BtnNavBar({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  final Size size;
  final double bodyMargin;
  int selectedIndex;
  final Function(int) onIndexChanged;

  @override
  State<BtnNavBar> createState() => _BtnNavBarState();
}

class _BtnNavBarState extends State<BtnNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height / 10,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: GradientColors.bottomNavBackground,
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.bodyMargin),
        child: Container(
          height: widget.size.height / 12,
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
                    onPressed: () {
                      setState(() {
                        widget.selectedIndex = indexList.homeIndex;
                      });
                      widget.onIndexChanged(widget.selectedIndex);
                    },
                    icon: ImageIcon(
                      AssetImage(Assets.icons.home.path),
                      color: SolidColors.lightIcon,
                    )),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.selectedIndex = indexList.newPostIndex;
                      });
                      widget.onIndexChanged(widget.selectedIndex);
                    },
                    icon: ImageIcon(
                      AssetImage(Assets.icons.write.path),
                      color: SolidColors.lightIcon,
                    )),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.selectedIndex = indexList.profileIndex;
                      });
                      widget.onIndexChanged(widget.selectedIndex);
                    },
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

class indexList {
  indexList._();

  static const homeIndex = 0;
  static const profileIndex = 1;
  static const newPostIndex = 2;
}
