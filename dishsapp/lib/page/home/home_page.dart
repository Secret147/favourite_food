import 'package:dishsapp/page/home/widget/home_appbar.dart';
import 'package:dishsapp/page/home/widget/home_list_item.dart';
import 'package:dishsapp/page/home/widget/home_search.dart';
import 'package:flutter/material.dart';
import 'package:dishsapp/model/dish.dart';
import 'package:dishsapp/providers/provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeAppbar(),

          // HomeSearch(),
          // SizedBox(
          //   height: 18,
          // ),
          Expanded(
            child: HomeListitem(),
          )
        ],
      ),
    ));
  }
}
