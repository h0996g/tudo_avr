import 'package:tudo_avr/core/database/database_service.dart';

class AuthDatabase {
  static Future<List<Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) async {
    try {
      return await DatabaseService.database.query(
        'users',
        where: 'email = ? AND password = ?',
        whereArgs: [email, password],
      );
    } catch (e) {
      print('Error during login: $e');
      return [];
    }
  }

  static Future<void> register({
    required String name,
    required String email,
    required String age,
    required String password,
  }) async {
    try {
      await DatabaseService.database.insert('users', {
        'name': name,
        'age': int.tryParse(age) ?? 0,
        'email': email,
        'password': password,
      });
      print('User registered successfully');
    } catch (e) {
      print('Error registering user: $e');
    }
  }
}
