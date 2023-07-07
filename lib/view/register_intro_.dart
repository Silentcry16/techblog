import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/widgets/custom_text.dart';

import '../components/dimens.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});
  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.2,
          ),
          SvgPicture.asset(
            Assets.images.tcbot,
            height: Dimens.xlarge + 36,
          ),
          Padding(
            padding: EdgeInsets.only(top: Dimens.medium),
            child: CustomText(
                textAlign: TextAlign.center,
                text: MyStrings.welcom,
                size: 14,
                textColor: SolidColors.blackColor,
                weight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(top: Dimens.medium),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(SolidColors.primaryColor)),
                onPressed: () {},
                child: CustomText(
                    text: MyStrings.letsGo,
                    size: 14,
                    textColor: SolidColors.lightText,
                    weight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
