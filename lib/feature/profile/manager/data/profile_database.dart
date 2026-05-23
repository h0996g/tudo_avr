import 'package:tudo_avr/core/cache/cache.dart';
import 'package:tudo_avr/core/const/cach_keys.dart';
import 'package:tudo_avr/core/database/database_service.dart';
import 'package:tudo_avr/feature/profile/manager/models/profile_m.dart';

class ProfileDatabase {
  static Future<ProfileM> getProfileById() async {
    try {
      final List<Map<String, dynamic>> result = await DatabaseService.database
          .query(
            'users',
            where: 'id = ?',
            whereArgs: [Cache.pref.getInt(CacheKeys.userId)],
          );
      print('Profile data fetched: ${result.first}');
      return ProfileM.fromJson(result.first);
    } catch (e) {
      print('Error fetching profile: $e');
      return ProfileM();
    }
  }

  static Future<ProfileM> updateProfile(ProfileM profileData) async {
    try {
      await DatabaseService.database.update(
        'users',
        profileData.toJson(),
        where: 'id = ?',
        whereArgs: [Cache.pref.getInt(CacheKeys.userId)],
      );
      return await getProfileById();
    } catch (e) {
      print('Error updating profile: $e');
      return ProfileM();
    }
  }
}
