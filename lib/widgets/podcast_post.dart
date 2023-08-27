import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';

import '../components/my_colors.dart';

import 'custom_text.dart';
import 'loading_kit.dart';

// ignore: must_be_immutable
class PostCastList extends StatelessWidget {
  PostCastList({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  HomeScreenController homeScreenController = Get.find();
  @override
  Widget build(BuildContext context) {
    log(homeScreenController.podCastList.length.toString());
    return SizedBox(
      width: size.width,
      height: size.height / 3.7,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.podCastList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 0),
              child: SizedBox(
                width: size.width * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width / 2.4,
                      height: size.height / 5.3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: GradientColors.blogPost),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              homeScreenController.podCastList[index].poster!,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(image: imageProvider)),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return const Icon(
                              Icons.image_not_supported,
                              size: 50,
                              color: Colors.black26,
                            );
                          },
                          placeholder: (context, url) {
                            return const LoadingKit();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: homeScreenController.podCastList[index].title!,
                      size: 14,
                      textColor: SolidColors.textTitle,
                      weight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

