import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static late SharedPreferences pref;

  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }
}
