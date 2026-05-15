import 'package:flutter/material.dart';
import 'package:tudo_avr/core/database/database_service.dart';
import 'package:tudo_avr/feature/auth/views/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const LoginPage());
  }
}
