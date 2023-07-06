import 'package:flutter/material.dart';

import '../constant/my_colors.dart';
import '../model/fake_data.dart';
import 'custom_text.dart';

class BlogPostList extends StatelessWidget {
  const BlogPostList({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height / 3.7,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: blogList.length,
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
                              image: DecorationImage(
                                  image: NetworkImage(blogList[index].imageUrl),
                                  fit: BoxFit.cover)),
                          foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: GradientColors.blogPost),
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
                                text: HomePagePosterMap['view'],
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
                    text: blogList[index].content,
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
    );
  }
}
