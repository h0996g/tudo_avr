import 'package:flutter/material.dart';

class RowRedirectWidget extends StatelessWidget {
  final String primaryText;
  final String buttonText;
  final VoidCallback onPressed;

  const RowRedirectWidget({
    super.key,
    required this.primaryText,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(primaryText),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.brown,
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      ],
    );
  }
}
