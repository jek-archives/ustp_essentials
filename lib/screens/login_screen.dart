import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/password_text_field.dart';
import '../utils/gradient_background.dart';
import 'forgot_password_screen.dart';
import '../widgets/logo_widget.dart';
import '../utils/navigation.dart'; // Import navigation helper
import 'home_page.dart'; // Import home page

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _mockLogin() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      // Navigate to home page if login is successful
      navigateWithFade(context, HomePage());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter email and password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoWidget(), // Added logo here
                const SizedBox(height: 20),
                const Text(
                  "Log In",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: _emailController, label: "Email"),
                      const SizedBox(height: 12),
                      PasswordTextField(
                          controller: _passwordController, label: "Password"),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () =>
                              navigateWithFade(context, ForgotPasswordScreen()),
                          child: const Text("Forgot Password?",
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _mockLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade300,
                          minimumSize: const Size(double.infinity, 45),
                        ),
                        child: const Text("Sign In",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 50,
              left: 16,
              child: IconButton(
                icon:
                    const Icon(Icons.arrow_back, size: 24, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
