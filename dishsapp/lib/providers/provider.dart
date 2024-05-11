import 'package:dishsapp/model/user.dart';
import 'package:dishsapp/model/userlogin.dart';
import 'package:dishsapp/providers/user_repo.dart';
import 'package:dishsapp/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:dishsapp/providers/api_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<bool> login(UserLogin userLogin) async {
    final data = await UserApi.loginRe(userLogin);
    final SharedPreferences prefs = await Utils.prefs;
    notifyListeners();
    if (data.email != "") {
      prefs.setString("email", data.email);
      prefs.setString("username", data.name);
      return true;
    }
    return false;
  }

  Future<dynamic> signup(User userSignup) async {
    final data = await UserApi.signupRe(userSignup);
    notifyListeners();
    return data;
  }

  Future<String> getUserName() async {
    final SharedPreferences prefs = await Utils.prefs;
    String username = "";

    if (prefs.getString("email") == null) {
      username = "Username";
    } else {
      username = prefs.getString("username").toString();
    }
    notifyListeners();
    return username;
  }

  Future<dynamic> likedProvider(int productId) async {
    final data = await APIDish.liked(productId);
    notifyListeners();
    return data;
  }

  Future<dynamic> checkedProvider(int productId) async {
    final data = await APIDish.checkLiked(productId);
    notifyListeners();
    return data;
  }
}
