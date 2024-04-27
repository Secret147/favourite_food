import 'package:dishsapp/model/dish.dart';
import 'package:dishsapp/providers/dish_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    print(context.read<DishProvider>().test);

    return Scaffold(
        body: FutureBuilder(
      future: context.read<DishProvider>().getListLiked(),
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
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
            itemCount: listItem.length,
            itemBuilder: (BuildContext context, int index) {
              return AspectRatio(
                aspectRatio: 5 / 2,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    listItem[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
          ),
        );
      },
    ));
  }
}
