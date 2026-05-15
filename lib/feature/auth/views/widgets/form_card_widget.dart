import 'package:flutter/material.dart';

class FormCardWidget extends StatelessWidget {
  final Widget? child;
  const FormCardWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(32.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: child,
    );
  }
}
