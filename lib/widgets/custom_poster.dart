import 'package:flutter/material.dart';

import '../components/my_colors.dart';
import '../model/fake_data.dart';
import 'custom_text.dart';

class CustomPoster extends StatelessWidget {
  const CustomPoster({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.19,
          height: size.height / 4.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(HomePagePosterMap['Image']),
              fit: BoxFit.cover,
            ),
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
                colors: GradientColors.homePosterCoverGradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text:
                        '${HomePagePosterMap['writer']} - ${HomePagePosterMap['date']}',
                    textColor: SolidColors.posterSubTitle,
                    fontFamily: 'Dana',
                    size: 14,
                    weight: FontWeight.w300,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: '${HomePagePosterMap['view']}',
                        textColor: SolidColors.posterSubTitle,
                        fontFamily: 'Dana',
                        size: 14,
                        weight: FontWeight.w300,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.remove_red_eye_sharp,
                        size: 16,
                        color: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              CustomText(
                text: '${HomePagePosterMap['title']}',
                textColor: SolidColors.posterTitle,
                fontFamily: 'Dana',
                size: 16,
                weight: FontWeight.bold,
              ),
            ],
          ),
        )
      ],
    );
  }
}
