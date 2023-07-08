import 'package:flutter/material.dart';
import 'package:tech_blog/constant/my_colors.dart';

import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/widgets/custom_text.dart';

import '../widgets/icon_title.dart';
import '../widgets/my_divider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      color: Colors.black12,
                      offset: Offset(0, 0))
                ],
                color: SolidColors.scaffoldBg,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(95),
                  bottomLeft: Radius.circular(95),
                )),
            height: size.height / 4,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  Assets.images.profileAvatar.path,
                  height: 100,
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconTitle(
                        size: size,
                        text: MyStrings.imageProfileEdit,
                        icon: Assets.icons.bluePen.path),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          CustomText(
              text: 'محمد بوستانی',
              size: 14,
              textColor: SolidColors.blackColor,
              weight: FontWeight.bold),
          const SizedBox(
            height: 16,
          ),
          CustomText(
              text: 'boustani.dev@gmail.com',
              size: 14,
              textColor: SolidColors.blackColor,
              weight: FontWeight.bold),
          const SizedBox(
            height: 40,
          ),
          MyDivider(size: size),
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            splashColor: SolidColors.primaryColor.withOpacity(0.5),
            child: SizedBox(
              width: size.width / 1.5,
              height: 45,
              child: Center(
                child: CustomText(
                    text: MyStrings.myFavBlog,
                    size: 14,
                    textColor: SolidColors.blackColor,
                    weight: FontWeight.bold),
              ),
            ),
          ),
          MyDivider(size: size),
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            splashColor: SolidColors.primaryColor.withOpacity(0.5),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              width: size.width / 1.5,
              height: 45,
              child: Center(
                child: CustomText(
                    text: MyStrings.myFavPodcast,
                    size: 14,
                    textColor: SolidColors.blackColor,
                    weight: FontWeight.bold),
              ),
            ),
          ),
          MyDivider(size: size),
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            splashColor: SolidColors.primaryColor.withOpacity(0.5),
            child: SizedBox(
              width: size.width / 1.5,
              height: 45,
              child: Center(
                child: CustomText(
                    text: MyStrings.logOut,
                    size: 14,
                    textColor: SolidColors.blackColor,
                    weight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
