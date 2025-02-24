import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import '../utils/navigation.dart';
import '../widgets/logo_widget.dart';
import '../utils/gradient_background.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoWidget(),
              const SizedBox(height: 20),
              _buildButton(context, "CREATE ACCOUNT", Colors.yellow.shade600,
                  () {
                navigateWithFade(context, SignupScreen());
              }),
              const SizedBox(height: 10),
              _buildButton(context, "LOG IN", Colors.blue.shade300, () {
                navigateWithFade(context, LoginScreen());
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: 250,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(text,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
