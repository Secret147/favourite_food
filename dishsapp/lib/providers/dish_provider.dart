import 'package:flutter/material.dart';
import 'package:dishsapp/repositories/api_repository.dart';

class DishProvider extends ChangeNotifier {
  int test = 4;
  Future<dynamic> getAllDish() async {
    final data = await APIDish.callAPIDish();
    return data;
  }

  Future<dynamic> getListLiked() async {
    final data = await APIDish.callAPILikedDish();
    return data;
  }

  Future<bool> putLiked(num id) async {
    final data = await APIDish.callLiked(id);
    notifyListeners();
    return data;
  }

  Future<bool> postDish(dynamic dish) async {
    final data = await APIDish.PostDish(dish);
    notifyListeners();
    return data;
  }

  void initValue(context) {
    test = 3;
    var snackBar = const SnackBar(
      content: Text('Bạn đã nhấn nút 2!'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
