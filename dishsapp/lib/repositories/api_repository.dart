import 'package:dio/dio.dart';
import 'package:dishsapp/model/dish.dart';

class APIDish {
  static Future<List<Dish>> callAPIDish() async {
    try {
      final dio = Dio();
      final response = await dio.get("http://localhost:8080/dish/all");

      final List<dynamic> dishListData = response.data;

      List<Dish> dishList =
          dishListData.map((data) => Dish.fromMap(data)).toList();
      return dishList;
    } catch (e) {
      // Xử lý lỗi, bạn có thể in ra hoặc xử lý theo ý bạn
      print("Error fetching dishes: $e");
      rethrow;
    }
  }

  static Future<List<Dish>> callAPILikedDish() async {
    try {
      final dio = Dio();
      final response = await dio.get("http://localhost:8080/dish/listlike");

      final List<dynamic> dishListData = response.data;

      List<Dish> dishList =
          dishListData.map((data) => Dish.fromMap(data)).toList();
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
      final response =
          await dio.put("http://192.42.42.101:8080/dish/liked/$id");

      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> PostDish(dynamic dish) async {
    try {
      final dio = Dio();
      final response =
          await dio.post("http://localhost:8080/dish/newdish", data: dish);

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
