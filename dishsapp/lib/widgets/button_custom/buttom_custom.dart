import 'package:dishsapp/utils/colors.dart';
import 'package:dishsapp/widgets/text_normal/text_normal.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  ButtonCustom(
      {super.key,
      required this.text,
      this.color = AppColors.mainColor,
      this.background = AppColors.mainColor,
      this.textColor = AppColors.brightColor});
  final String text;
  Color color;
  Color background;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: background,
          border: Border.all(color: color)),
      child: Center(
          child: TextNormal(
        text: text,
        color: textColor,
      )),
    );
  }
}
