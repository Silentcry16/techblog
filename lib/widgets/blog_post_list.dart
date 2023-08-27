import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/widgets/loading_kit.dart';

import '../components/my_colors.dart';
import '../model/fake_data/fake_data.dart';
import 'custom_text.dart';

class BlogPostList extends StatelessWidget {
  BlogPostList({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  HomeScreenController homeScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height / 3.7,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topVisitedList.length,
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
                      child: Stack(
                        children: [
                          Container(
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
                              imageUrl: homeScreenController
                                  .topVisitedList[index].image!,
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                );
                              },
                              placeholder: (context, url) {
                                return const LoadingKit();
                              },
                              errorWidget: (context, url, error) {
                                return const Icon(
                                  Icons.image_not_supported,
                                  color: Colors.black26,
                                  size: 50,
                                );
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 8,
                            child: CustomText(
                              text: blogList[index].writer,
                              size: 14,
                              textColor: SolidColors.lightText,
                              weight: FontWeight.w300,
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 8,
                            child: Row(
                              children: [
                                CustomText(
                                  text: homeScreenController
                                      .topVisitedList[index].view!,
                                  size: 14,
                                  textColor: SolidColors.lightText,
                                  weight: FontWeight.w300,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const Icon(
                                  Icons.remove_red_eye_sharp,
                                  size: 14,
                                  color: SolidColors.lightIcon,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: homeScreenController.topVisitedList[index].title!,
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
