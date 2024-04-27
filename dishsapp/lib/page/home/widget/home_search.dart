import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search Key...",
        enabledBorder: outlineCustom(),
        focusedBorder: outlineCustom(),
        suffixIcon: const Icon(CupertinoIcons.search),
      ),
    );
  }

  OutlineInputBorder outlineCustom() => OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(10));
}
