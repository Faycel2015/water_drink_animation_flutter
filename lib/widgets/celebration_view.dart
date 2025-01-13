import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CelebrationView extends StatelessWidget {
  const CelebrationView({super.key}); // Add this line

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/animations/celebration.json'),
    );
  }
}
