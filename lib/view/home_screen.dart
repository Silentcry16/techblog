import 'package:flutter/material.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/model/hashtag_model.dart';

import '../widgets/custom_text.dart';
import '../model/fake_data.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<HashtagModel> hashtagData = [
    HashtagModel(title: 'برنامه‌نویسی'),
    HashtagModel(title: 'کدنویسی'),
    HashtagModel(title: 'طراحی وب'),
    HashtagModel(title: 'پایتون'),
    HashtagModel(title: 'جاوااسکریپت'),
    HashtagModel(title: 'موبایل اپلیکیشن'),
    HashtagModel(title: 'بلاکچین'),
    HashtagModel(title: 'هوش مصنوعی'),
    HashtagModel(title: 'تست نرم‌افزار'),
    HashtagModel(title: 'بانک‌های اطلاعاتی'),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //appbar
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.list)),
                  Image.asset(
                    Assets.images.logo.path,
                    height: size.height / 13.6,
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //Poster
            Stack(
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
            ),
            const SizedBox(
              height: 30,
            ),

            //Hashtags ListView
            Container(
              margin: const EdgeInsets.only(right: 30),
              width: size.width,
              height: size.height * 0.05,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hashtagData.length,
                itemBuilder: (context, i) {
                  return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 30),
                    padding: const EdgeInsets.only(right: 5),
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: GradientColors.tags,
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Assets.icons.hashtagicon.path,
                          height: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomText(
                            text: hashtagData[i].title,
                            size: 14,
                            textColor: SolidColors.hashTag,
                            weight: FontWeight.w300,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
