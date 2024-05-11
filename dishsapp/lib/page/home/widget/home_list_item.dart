import 'package:flutter/material.dart';

import 'package:dishsapp/model/dish.dart';
import 'package:dishsapp/providers/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

class HomeListitem extends StatefulWidget {
  const HomeListitem({super.key});

  @override
  State<HomeListitem> createState() => _HomeListitemState();
}

class _HomeListitemState extends State<HomeListitem> {
  dynamic checkIsLiked;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: context.read<DishProvider>().getAllDish(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return Container(
              child: const Text("no data"),
            );
          }
          List<Dish> listItem = snapshot.data as List<Dish>;

          return Container(
            child: GridView.builder(
              itemCount: listItem.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () =>
                      context.goNamed("detail", extra: listItem[index]),
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(
                              listItem[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 4,
                            right: 4,
                            child: FutureBuilder(
                                future: context
                                    .read<DishProvider>()
                                    .checkedProvider(listItem[index].id),
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
                                      child: const Text("no data"),
                                    );
                                  }

                                  int checked = snapshot.data as int;
                                  return LikeButton(
                                    isLiked: checked == 1 ? true : false,
                                    onTap: (isLiked) {
                                      context
                                          .read<DishProvider>()
                                          .likedProvider(listItem[index].id);

                                      return Future(() => (!isLiked));
                                    },
                                  );
                                }),
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        listItem[index].title,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
