import 'package:flutter/material.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_poster.dart';
import '../widgets/custom_text.dart';
import '../model/fake_data.dart';
import '../widgets/hashtag_list_view.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    double bodyMargin = size.width * 0.076;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //appbar
            CustomAppBar(size: size),
            const SizedBox(
              height: 10,
            ),
            //Poster
            CustomPoster(size: size),
            const SizedBox(
              height: 30,
            ),
            //Hashtags ListView
            HashtagListView(size: size, bodyMargin: bodyMargin),
            const SizedBox(
              height: 32,
            ),
            //newest blog posts title (see more)
            Padding(
              padding: EdgeInsets.only(right: bodyMargin),
              child: Row(
                children: [
                  Image.asset(
                    Assets.icons.bluePen.path,
                    height: size.height * 0.03,
                  ),
                  CustomText(
                      text: MyStrings.viewHotestBlog,
                      size: 14,
                      textColor: SolidColors.seeMore,
                      weight: FontWeight.bold),
                ],
              ),
            ),
            //Blog list
            Container(
              width: size.width,
              height: size.height / 4.1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: blogList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: index == 0 ? bodyMargin : 0),
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
                                          image: NetworkImage(
                                              blogList[index].imageUrl),
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
                            // maxLines: 2,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
