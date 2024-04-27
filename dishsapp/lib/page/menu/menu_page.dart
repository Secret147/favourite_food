import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

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
                "Category Screen",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.settings, color: Colors.white),
              title: Text(
                "Setting Sreen",
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
