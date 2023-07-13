import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/widgets/custom_text.dart';
import '../components/dimens.dart';
import '../components/my_colors.dart';
import '../components/my_strings.dart';

// ignore: must_be_immutable
class RegisterIntro extends StatefulWidget {
  RegisterIntro({super.key});

  @override
  State<RegisterIntro> createState() => _RegisterIntroState();
}

class _RegisterIntroState extends State<RegisterIntro> {
  TextEditingController emailController = TextEditingController();
  TextEditingController activateCodeController = TextEditingController();
  var size = Get.size;
  bool emailCheck = false;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: EdgeInsets.all(24),
            height: size.height / 2.8,
            child: Column(
              children: [
                CustomText(
                  text: MyStrings.insertYourEmail,
                  size: 14,
                  textColor: SolidColors.blackColor,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  onChanged: (val) {
                    emailCheck = isEmail(val);
                  },
                  autofocus: true,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: 'Example@mail.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        SolidColors.primaryColor,
                      ),
                    ),
                    onPressed: () {
                      if (emailCheck == true) {
                        Get.back();
                        activateBottomSheet(context);
                      } else {
                        return;
                      }
                    },
                    child: CustomText(
                      text: MyStrings.continuebtn,
                      size: 14,
                      textColor: SolidColors.lightText,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void activateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: EdgeInsets.all(24),
            height: size.height / 3,
            child: Column(
              children: [
                CustomText(
                  text: MyStrings.activateCode,
                  size: 14,
                  textColor: SolidColors.blackColor,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: activateCodeController,
                  onChanged: (val) {},
                  autofocus: true,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: '******',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        SolidColors.primaryColor,
                      ),
                    ),
                    onPressed: () {},
                    child: CustomText(
                      text: MyStrings.continuebtn,
                      size: 14,
                      textColor: SolidColors.lightText,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.images.tcbot,
            height: Dimens.xlarge + 36,
          ),
          Padding(
            padding: EdgeInsets.only(top: Dimens.medium),
            child: CustomText(
                textAlign: TextAlign.center,
                text: MyStrings.welcom,
                size: 14,
                textColor: SolidColors.blackColor,
                weight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(top: Dimens.medium),
            child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(SolidColors.primaryColor),
                ),
                onPressed: () {
                  _showBottomSheet(context);
                },
                child: CustomText(
                    text: MyStrings.letsGo,
                    size: 14,
                    textColor: SolidColors.lightText,
                    weight: FontWeight.bold)),
          )
        ],
      ),
    ));
  }
}
