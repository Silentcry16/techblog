import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/model/fake_data.dart';
import 'package:tech_blog/model/hashtag_model.dart';

import '../constant/my_colors.dart';
import '../constant/my_strings.dart';
import '../widgets/custom_text.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.tcbot,
                height: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                textAlign: TextAlign.center,
                text: MyStrings.successfulRegistration,
                size: 14,
                textColor: SolidColors.blackColor,
                weight: FontWeight.bold,
              ),
              // txetfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: SizedBox(
                  height: 55,
                  child: TextField(
                    onChanged: (val) {},
                    autofocus: true,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: MyStrings.nameAndFamilyName,
                      hintStyle: const TextStyle(
                          fontFamily: 'Dana',
                          fontWeight: FontWeight.bold,
                          color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //choose the cats
              CustomText(
                text: MyStrings.chooseCats,
                size: 14,
                textColor: SolidColors.blackColor,
                weight: FontWeight.bold,
              ),
              const SizedBox(
                height: 15,
              ),
              //tag list
              Padding(
                padding: const EdgeInsets.all(2),
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.36,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: hashtagData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              myCats.add(HashtagModel(
                                  title: hashtagData[index].title));
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: const LinearGradient(
                                  colors: GradientColors.tags,
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 180,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: '#',
                                          size: 12,
                                          textColor: SolidColors.lightText,
                                          weight: FontWeight.bold),
                                      CustomText(
                                          text: hashtagData[index].title,
                                          size: 12,
                                          textColor: SolidColors.lightText,
                                          weight: FontWeight.bold),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Image.asset(
                Assets.icons.downCatArrow.path,
                scale: 3,
              ),
              // subtags
              Padding(
                padding: const EdgeInsets.all(2),
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 0.4,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: myCats.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                                colors: GradientColors.tags,
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 180,
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: '#',
                                        size: 12,
                                        textColor: SolidColors.lightText,
                                        weight: FontWeight.bold),
                                    CustomText(
                                        text: myCats[index].title,
                                        size: 12,
                                        textColor: SolidColors.lightText,
                                        weight: FontWeight.bold),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}