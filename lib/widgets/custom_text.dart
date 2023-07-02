// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String text;
  double size;
  Color textColor;
  FontWeight weight;
  String? fontFamily;
  TextAlign? textAlign;
  int? maxLines;
  TextOverflow? overflow;

  CustomText(
      {Key? key,
      required this.text,
      required this.size,
      required this.textColor,
      required this.weight,
      this.fontFamily = 'Dana',
      this.maxLines,
      this.textAlign,
      this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
          fontSize: size,
          fontWeight: weight,
          fontFamily: fontFamily,
          color: textColor,
          overflow: overflow),
    );
  }
}
