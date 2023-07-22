import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_blog/components/my_components.dart';

import '../components/my_colors.dart';
import '../components/my_strings.dart';
import '../gen/assets.gen.dart';
import 'custom_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: SolidColors.scaffoldBg,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                color: SolidColors.scaffoldBg,
                border:
                    Border(bottom: BorderSide(color: SolidColors.scaffoldBg))),
            child: Image.asset(
              Assets.images.logo.path,
              scale: 2,
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: () async {},
                  title: CustomText(
                      text: MyStrings.userProfile,
                      size: 12,
                      textColor: SolidColors.blackColor,
                      weight: FontWeight.bold),
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  title: CustomText(
                      text: MyStrings.aboutTec,
                      size: 12,
                      textColor: SolidColors.blackColor,
                      weight: FontWeight.bold),
                ),
                const Divider(),
                ListTile(
                  onTap: () async {
                    await Share.share(MyStrings.shareText);
                  },
                  title: CustomText(
                      text: MyStrings.shareTec,
                      size: 12,
                      textColor: SolidColors.blackColor,
                      weight: FontWeight.bold),
                ),
                const Divider(),
                ListTile(
                  onTap: () => MyComponents.openUrl(
                      url: 'https://github.com/boustani-dev/techblog'),
                  title: CustomText(
                      text: MyStrings.tecIngithub,
                      size: 12,
                      textColor: SolidColors.blackColor,
                      weight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
