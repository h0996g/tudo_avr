import 'package:flutter/material.dart';
import 'package:tudo_avr/core/cache/cache.dart';
import 'package:tudo_avr/core/const/cach_keys.dart';
import 'package:tudo_avr/core/database/database_service.dart';
import 'package:tudo_avr/feature/auth/views/login_page.dart';
import 'package:tudo_avr/feature/start/start_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.init();
  await Cache.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Cache.pref.getInt(CacheKeys.userId) != null
          ? const StartPage()
          : const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
