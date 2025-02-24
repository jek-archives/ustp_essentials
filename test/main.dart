import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

// Welcome Screen
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildGradientBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoWidget(),
              _buildButton(context, "CREATE ACCOUNT", Colors.yellow.shade300,
                  () {
                _navigateWithFade(context, SignupScreen());
              }),
              const SizedBox(height: 10),
              _buildButton(context, "LOG IN", Colors.blue.shade300, () {
                _navigateWithFade(context, LoginScreen());
              }),
            ],
          ),
        ),
      ),
    );
  }
}

// Sign-up Screen
class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _errorText;

  void _validatePasswords(String value) {
    setState(() {
      _errorText = (_passwordController.text == _confirmPasswordController.text)
          ? null
          : "Passwords do not match!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildGradientBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Sign Up",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                CustomTextField(controller: _emailController, label: "Email"),
                SizedBox(height: 12),
                PasswordTextField(
                  label: "Password",
                  controller: _passwordController,
                  onChanged: _validatePasswords,
                ),
                SizedBox(height: 12),
                PasswordTextField(
                  label: "Confirm Password",
                  controller: _confirmPasswordController,
                  onChanged: _validatePasswords,
                ),
                if (_errorText != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _errorText!,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _errorText == null ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade300,
                    minimumSize: Size(double.infinity, 45),
                  ),
                  child: Text("Get Started!",
                      style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Login Screen
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildGradientBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Log In",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                CustomTextField(controller: _emailController, label: "Email"),
                SizedBox(height: 12),
                PasswordTextField(
                  label: "Password",
                  controller: _passwordController,
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()),
                      );
                    },
                    child: Text("Forgot Password?",
                        style: TextStyle(color: Colors.grey.shade600)),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade300,
                    minimumSize: Size(double.infinity, 45),
                  ),
                  child: Text("Sign In", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Forgot Password Screen
class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildGradientBackground(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, size: 24),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[500],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Enter Email Address',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 8),
                      CustomTextField(
                          label: "Email", controller: TextEditingController()),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[400],
                          minimumSize: Size(double.infinity, 45),
                        ),
                        child: Text("SEND",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Text Field
class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  CustomTextField({required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

// Password Field with Toggle Visibility
class PasswordTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  PasswordTextField(
      {required this.label, required this.controller, this.onChanged});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}

// Gradient Background
Widget _buildGradientBackground({required Widget child}) {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.deepPurple],
      ),
    ),
    child: SafeArea(child: child),
  );
}
