import 'package:tudo_avr/core/cache/cache.dart';
import 'package:tudo_avr/core/const/cach_keys.dart';
import 'package:tudo_avr/core/database/database_service.dart';

class ProfileDatabase {
  static Future<Map<String, dynamic>> getProfileById() async {
    try {
      final List<Map<String, dynamic>> result = await DatabaseService.database
          .query(
            'users',
            where: 'id = ?',
            whereArgs: [Cache.pref.getInt(CacheKeys.userId)],
          );
      print('Profile data fetched: ${result.first}');
      return result.first;
    } catch (e) {
      print('Error fetching profile: $e');
      return {};
    }
  }
}
