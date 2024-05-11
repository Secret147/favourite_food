import 'package:shared_preferences/shared_preferences.dart';

const String baseUrl = "http://192.42.42.100:8080";

class Utils {
  static final Future<SharedPreferences> prefs =
      SharedPreferences.getInstance();
}
