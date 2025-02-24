import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double logoSize = screenWidth * 0.5; // Adjust size based on screen width

    return Column(
      children: [
        Image.asset(
          'assets/logo.png',
          width: logoSize,
          height: logoSize,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
