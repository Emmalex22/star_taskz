import 'package:flutter/material.dart';
import '../widgets/inputs_field.dart';
import 'bottom_nav.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? emailError;
  String? passwordError;

  // ✅ Function to validate and navigate
  void handleLogin() {
    setState(() {
      emailError = emailController.text.isEmpty ? 'Email is required' : null;
      passwordError = passwordController.text.isEmpty ? 'Password is required' : null;
    });

    if (emailError == null && passwordError == null) {
      // Navigate to HomeScreen after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNav()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              InputField(
                label: 'Email',
                hintText: 'Enter your email',
                hiddenText: false,
                controller: emailController,
                errorText: emailError,
              ),
              const SizedBox(height: 20),

              InputField(
                label: 'Password',
                hintText: 'Enter your password',
                hiddenText: true,
                controller: passwordController,
                errorText: passwordError,
              ),
              const SizedBox(height: 16),

              Center(
                child: TextButton(
                  onPressed: () {
                    // Optional: Navigate to a reset password screen
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}