import 'package:dishsapp/providers/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeAppbar extends StatefulWidget {
  const HomeAppbar({super.key});

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return FutureBuilder(
                      future: context.read<DishProvider>().getUserName(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (!snapshot.hasData) {
                          return Container(
                            child: const Text("Not connecting"),
                          );
                        }
                        String name = snapshot.data as String;
                        return Text(
                          'Hello, $name',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        );
                      });
                }),
            const Text(
              'Good Morning',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 91, 89, 89),
              ),
            ),
          ],
        ),
        const Icon(CupertinoIcons.bell),
      ],
    );
  }
}
