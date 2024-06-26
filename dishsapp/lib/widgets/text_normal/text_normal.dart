// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dishsapp/utils/colors.dart';
import 'package:flutter/material.dart';

class TextNormal extends StatelessWidget {
  final String text;
  double textSize;
  Color color;
  TextOverflow overflow;
  FontWeight weight;

  TextNormal({
    Key? key,
    required this.text,
    this.textSize = 0,
    this.color = AppColors.brightColor,
    this.overflow = TextOverflow.ellipsis,
    this.weight = FontWeight.w600,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize == 0 ? 16 : textSize,
        overflow: overflow,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
