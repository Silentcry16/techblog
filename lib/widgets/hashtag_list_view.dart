import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/model/hashtag_model.dart';

import '../components/my_colors.dart';
import '../gen/assets.gen.dart';
import '../model/fake_data/fake_data.dart';
import 'custom_text.dart';

class HashtagListView extends StatelessWidget {
  HashtagListView({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  HomeScreenController homeScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    log(homeScreenController.tagsList.length.toString() + '111111');
    return SizedBox(
      // margin: const EdgeInsets.only(right: 30),
      width: size.width,
      height: size.height * 0.05,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.tagsList.length,
          itemBuilder: (context, i) {
            return Container(
              alignment: Alignment.center,
              margin: i == 0
                  ? EdgeInsets.only(right: bodyMargin)
                  : const EdgeInsets.only(right: 10, left: 5),
              padding: const EdgeInsets.all(8),
              height: size.height * 0.05,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: GradientColors.tags,
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft),
                  borderRadius: BorderRadius.circular(24)),
              child: Row(
                children: [
                  Image.asset(
                    Assets.icons.hashtagicon.path,
                    height: 15,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  CustomText(
                    text: homeScreenController.tagsList[i].title!,
                    size: 14,
                    textColor: SolidColors.hashTag,
                    weight: FontWeight.w300,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
