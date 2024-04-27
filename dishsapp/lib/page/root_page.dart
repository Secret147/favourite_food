import 'package:dishsapp/page/home/home_page.dart';
import 'package:dishsapp/page/menu/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class RootPage extends StatefulWidget {
  Widget child;
  RootPage({super.key, required this.child});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      style: DrawerStyle.defaultStyle,
      menuScreen: const MenuPage(),
      mainScreen: widget.child,
      borderRadius: 24.0,
      showShadow: true,
      angle: -12.0,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
    );
  }
}
