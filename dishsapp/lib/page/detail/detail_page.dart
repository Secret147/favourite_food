import 'package:dishsapp/model/dish.dart';
import 'package:dishsapp/providers/dish_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.item});
  final Dish item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: Image.network(item.image, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              right: 8,
              bottom: 8,
              child: LikeButton(
                isLiked: item.liked == 1 ? true : false,
                onTap: (isLiked) {
                  context.read<DishProvider>().putLiked(item.id);
                  return Future(() => !isLiked);
                },
              ),
            )
          ],
        ),
        Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "Comic Sans MS",
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Text(
                      item.description,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontFamily: "Comic Sans MS",
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ]),
    );
  }
}
