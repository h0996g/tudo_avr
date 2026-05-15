import 'package:flutter/material.dart';
import 'package:tudo_avr/core/widgets/submit_button_widget.dart';
import 'package:tudo_avr/core/widgets/text_input_widget.dart';
import 'package:tudo_avr/feature/auth/views/login_page.dart';
import 'package:tudo_avr/feature/auth/views/widgets/form_card_widget.dart';
import 'package:tudo_avr/feature/auth/views/widgets/gradient_backround_widget.dart';
import 'package:tudo_avr/feature/auth/views/widgets/row_redirect_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackgroundWidget(
        child: Center(
          child: FormCardWidget(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Register Page',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                TextInputWidget(
                  labelText: 'Name',
                  keyboardType: TextInputType.name,
                  prefixIcon: Icons.person,
                  controller: nameController,
                ),
                SizedBox(height: 16),
                TextInputWidget(
                  labelText: 'Age',
                  keyboardType: TextInputType.number,
                  prefixIcon: Icons.calendar_today,
                  controller: ageController,
                ),
                SizedBox(height: 16),
                TextInputWidget(
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email,
                  controller: emailController,
                ),
                SizedBox(height: 16),
                TextInputWidget(
                  labelText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icons.lock,
                  controller: passwordController,
                  suffixIcon: Icons.visibility,
                ),
                SizedBox(height: 24),
                SubmitButtonWidget(text: 'Register', onPressed: () {}),
                SizedBox(height: 5),
                RowRedirectWidget(
                  primaryText: "already have an account?",
                  buttonText: 'Sign In',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
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
