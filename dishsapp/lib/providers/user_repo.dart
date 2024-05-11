import 'package:dio/dio.dart';
import 'package:dishsapp/model/user.dart';
import 'package:dishsapp/model/userlogin.dart';
import 'package:dishsapp/utils/const.dart';

class UserApi {
  static Future<User> loginRe(UserLogin userLogin) async {
    try {
      final dio = Dio();
      final response =
          await dio.post("$baseUrl/user/login", data: userLogin.toJson());

      final dynamic responseData = response.data;
      User user = User.fromMap(responseData);

      return user;
    } catch (e) {
      print("Error fetching login: $e");
      rethrow;
    }
  }

  static Future<dynamic> signupRe(User userSignup) async {
    try {
      final dio = Dio();
      final response =
          await dio.post("$baseUrl/user/signup", data: userSignup.toJson());
      print(userSignup.email);

      final dynamic responseData = response.data;

      return responseData;
    } catch (e) {
      print("Error fetching signup: $e");
      rethrow;
    }
  }
}
