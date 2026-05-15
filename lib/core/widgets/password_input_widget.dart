import 'package:flutter/material.dart';
import 'package:tudo_avr/core/widgets/text_input_widget.dart';

class PasswordInputWidget extends StatefulWidget {
  final String labelText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;

  const PasswordInputWidget({
    super.key,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
  });

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      labelText: widget.labelText,
      keyboardType: widget.keyboardType,
      prefixIcon: widget.prefixIcon,
      controller: widget.controller,
      suffixIcon: widget.suffixIcon,
      suffixIconOnPressed: () {
        // Implement password visibility toggle logic here
      },
    );
  }
}
