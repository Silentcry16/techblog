import 'package:flutter/material.dart';

import '../constant/my_colors.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      thickness: 1.5,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}
