import 'package:flutter/material.dart';
import '../widgets/inputs_field.dart'; // Your reusable input field
import 'home_screen.dart';
import 'sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email and Password are required'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!mounted) return; // to avoid using context if screen is unmounted

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Login to your Account',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),

            // Email input
            InputField(
              controller: emailController,
              label: 'Email',
              hintText: 'Enter your email',
              hiddenText: false,
            ),

            const SizedBox(height: 16),

            // Password input
            InputField(
              controller: passwordController,
              label: 'Password',
              hintText: 'Enter your password',
              hiddenText: true,
            ),

            const SizedBox(height: 16),

            // Forgot password link
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  //navigation to a forgot password screen
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Login Button
            ElevatedButton(
              onPressed: handleLogin,
              child: const Text('Login'),
            ),

            const SizedBox(height: 16),

            // Continue with Google
            OutlinedButton.icon(
              onPressed: () {
                //Google Sign-In logic here
              },
              icon: Image.asset(
                'assets/google.png',
                height: 24,
                width: 24,
              ),
              label: const Text('Continue with Google'),
            ),

            const SizedBox(height: 16),

            // Continue with Apple
            OutlinedButton.icon(
              onPressed: () {
                // Apple Sign-In logic here
              },
              icon: Image.asset(
                'assets/Apple.png',
                height: 24,
                width: 24,
              ),
              label: const Text('Continue with Apple'),
            ),

            const SizedBox(height: 16),

            // Don't have an account? Sign Up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}