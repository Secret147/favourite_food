import 'package:dishsapp/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputCustom extends StatelessWidget {
  InputCustom({
    super.key,
    required this.label,
    required this.icon,
    this.focus = false,
    required this.controller,
  });
  final String label;
  final IconData icon;
  bool focus;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      controller: controller,
      style: const TextStyle(
          color: AppColors.textColor,
          fontSize: 20,
          decoration: TextDecoration.none,
          decorationThickness: 0),
      autofocus: focus,
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: AppColors.textGrayColor,
        ),
        focusColor: AppColors.brightColor,
        enabledBorder: outlineCustom(),
        focusedBorder: outlineCustom(),
        border: const OutlineInputBorder(),
        labelText: label,
        suffixIcon: Icon(
          icon,
        ),
      ),
    );
  }

  OutlineInputBorder outlineCustom() => OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      );
}
