import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final VoidCallback? suffixIconOnPressed;
  const TextInputWidget({
    super.key,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.suffixIconOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon, color: Colors.orange),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon, color: Colors.orange),
          onPressed: suffixIconOnPressed,
        ),

        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.orange, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.orange, width: 2.0),
        ),
      ),
    );
  }
}
