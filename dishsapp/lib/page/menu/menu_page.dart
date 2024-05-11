import 'package:dishsapp/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: () {
                context.goNamed("home");
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Home Screen",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                context.goNamed("favourite");
              },
              leading:
                  const Icon(CupertinoIcons.list_bullet, color: Colors.white),
              title: const Text(
                "Favourite Screen",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                context.goNamed("dish");
              },
              leading: const Icon(CupertinoIcons.table, color: Colors.white),
              title: const Text(
                "Add Dish",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () async {
                final SharedPreferences prefs = await Utils.prefs;
                await prefs.remove("email");
                await prefs.remove("username");
                context.goNamed("login");
              },
              leading: const Icon(Icons.exit_to_app, color: Colors.white),
              title: const Text(
                "Logout",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
