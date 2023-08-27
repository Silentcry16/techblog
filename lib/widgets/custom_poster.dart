import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tech_blog/widgets/loading_kit.dart';

import '../components/my_colors.dart';
import '../model/fake_data/fake_data.dart';
import 'custom_text.dart';

class CustomPoster extends StatelessWidget {
  CustomPoster({
    super.key,
    required this.size,
  });

  final Size size;
  HomeScreenController homeScreenController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Container(
            width: size.width / 1.19,
            height: size.height / 4.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                  colors: GradientColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: CachedNetworkImage(
              imageUrl: homeScreenController.poster.value.image!,
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                );
              },
              placeholder: (context, url) => const LoadingKit(),
              errorWidget: ((context, url, error) => const Icon(
                    Icons.image_not_supported_outlined,
                    size: 30,
                    color: SolidColors.greyColor,
                  )),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: CustomText(
              text: '${homeScreenController.poster.value.title}',
              textColor: SolidColors.posterSubTitle,
              fontFamily: 'Dana',
              size: 14,
              weight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
