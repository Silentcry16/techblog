import 'package:flutter/material.dart';

import '../constant/my_colors.dart';
import 'custom_text.dart';

class IconTitle extends StatelessWidget {
  const IconTitle({
    super.key,
    required this.size,
    required this.text,
    required this.icon,
    this.bodyMargin = 0,
  });

  final Size size;
  final String text;
  final String icon;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            icon,
            height: size.height * 0.03,
          ),
          CustomText(
              text: text,
              size: 14,
              textColor: SolidColors.seeMore,
              weight: FontWeight.bold),
        ],
      ),
    );
  }
}
