import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tudo_avr/core/cache/cache.dart';
import 'package:tudo_avr/core/const/cach_keys.dart';
import 'package:tudo_avr/core/widgets/submit_button_widget.dart';
import 'package:tudo_avr/core/widgets/text_input_widget.dart';
import 'package:tudo_avr/feature/auth/manager/data/auth_dababase.dart';
import 'package:tudo_avr/feature/auth/views/register_page.dart';
import 'package:tudo_avr/feature/auth/views/widgets/form_card_widget.dart';
import 'package:tudo_avr/feature/auth/views/widgets/gradient_backround_widget.dart';
import 'package:tudo_avr/feature/auth/views/widgets/row_redirect_widget.dart';
import 'package:tudo_avr/feature/start/start_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    final List result = await AuthDatabase.login(
      email: emailController.text,
      password: passwordController.text,
    );
    if (result.isNotEmpty) {
      Cache.pref.setInt(CacheKeys.userId, result.first['id']);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const StartPage()),
        (route) => false,
      );
      Fluttertoast.showToast(
        msg: "Login successful",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,

        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Login failed",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,

        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Future.delayed(const Duration(seconds: 5));
          print('Help button pressed');
        },
        child: const Icon(Icons.help_outline),
      ),
      body: GradientBackgroundWidget(
        child: Center(
          child: FormCardWidget(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextInputWidget(
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email,
                  controller: emailController,
                ),

                const SizedBox(height: 16),
                TextInputWidget(
                  labelText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icons.lock,
                  controller: passwordController,
                  suffixIcon: Icons.visibility,
                ),
                const SizedBox(height: 24),
                SubmitButtonWidget(
                  text: 'Login',
                  onPressed: () {
                    login();
                  },
                ),
                SizedBox(height: 5),
                RowRedirectWidget(
                  primaryText: "Don't have an account?",
                  buttonText: 'Sign Up',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
