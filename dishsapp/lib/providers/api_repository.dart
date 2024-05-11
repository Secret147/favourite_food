import 'package:dio/dio.dart';
import 'package:dishsapp/model/dish.dart';
import 'package:dishsapp/model/liked.dart';
import 'package:dishsapp/utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIDish {
  static Future<List<Dish>> callAPIDish() async {
    try {
      final dio = Dio();
      final response = await dio.get("$baseUrl/dish/all");

      final List<dynamic> dishListData = response.data;

      List<Dish> dishList =
          dishListData.map((data) => Dish.fromMap(data)).toList();
      return dishList;
    } catch (e) {
      print("Error fetching dishes: $e");
      rethrow;
    }
  }

  static Future<List<Dish>> callAPILikedDish() async {
    try {
      final dio = Dio();
      final SharedPreferences prefs = await Utils.prefs;
      dynamic email = prefs.getString("email");
      final response = await dio.get("$baseUrl/userproduct/list/liked",
          data: email.toString());

      final List<dynamic> dishListData = response.data;

      List<Dish> dishList =
          dishListData.map((data) => Dish.fromMap(data["product"])).toList();
      return dishList;
    } catch (e) {
      // Xử lý lỗi, bạn có thể in ra hoặc xử lý theo ý bạn
      print("Error fetching dishes: $e");
      rethrow;
    }
  }

  static Future<bool> callLiked(num id) async {
    try {
      final dio = Dio();
      final response = await dio.put("$baseUrl/dish/liked/$id");

      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> PostDish(dynamic dish) async {
    try {
      final dio = Dio();
      final response = await dio.post("$baseUrl/dish/newdish", data: dish);

      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> liked(int productId) async {
    try {
      final SharedPreferences prefs = await Utils.prefs;
      dynamic email = prefs.getString("email");
      Liked liked = Liked(productId: productId, email: email);
      final dio = Dio();
      final response =
          await dio.post("$baseUrl/userproduct/liked", data: liked.toJson());

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> checkLiked(int productId) async {
    try {
      final SharedPreferences prefs = await Utils.prefs;
      dynamic email = prefs.getString("email");
      Liked liked = Liked(productId: productId, email: email);
      final dio = Dio();
      final response =
          await dio.post("$baseUrl/userproduct/checked", data: liked.toJson());

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
