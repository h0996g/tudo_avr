import 'package:flutter/material.dart';

class GradientBackgroundWidget extends StatelessWidget {
  final Widget? child;
  const GradientBackgroundWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 157, 121, 108), Colors.orange],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
