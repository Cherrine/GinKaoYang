import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // For Firestore
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ginkhaoyang/pages/home_page.dart';
import 'package:ginkhaoyang/pages/landing_page.dart';
import 'package:ginkhaoyang/pages/register.dart'; // Import the registration page
import 'package:ginkhaoyang/utils/fade_page_route.dart';
import 'package:ginkhaoyang/components/input_textfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'helloworld_page.dart'; // Import HelloWorld page

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Method to verify user credentials
  Future<void> loginUser() async {
    CollectionReference users = FirebaseFirestore.instance.collection('User');
    QuerySnapshot result = await users
        .where('Email', isEqualTo: emailController.text)
        .where('password_hash', isEqualTo: passwordController.text)
        .get();

    if (result.docs.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HelloWorldPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const double contentWidth = 350.0;

    return Stack(
      children: [
        Scaffold(
          body: Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: contentWidth),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 140),
                            Text(
                              'Login',
                              style: GoogleFonts.cabin(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Welcome back! Let\'s have a meal today.',
                              style: GoogleFonts.cabin(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 50),
                            InputTextField(
                              controller: emailController,
                              hintText: 'Email or Username',
                              obscureText: false,
                            ).animate().fadeIn(delay: 300.ms, duration: 500.ms),
                            const SizedBox(height: 20),
                            InputTextField(
                              controller: passwordController,
                              hintText: 'Password',
                              obscureText: true,
                            ).animate().fadeIn(delay: 400.ms, duration: 500.ms),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: loginUser, // Call the login function
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFB9A1C),
                                foregroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ).animate().fadeIn(delay: 500.ms, duration: 500.ms),
                            const SizedBox(height: 20),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      thickness: 0.5,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                      'Or Continue with',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      thickness: 0.5,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ],
                              ),
                            ).animate().fadeIn(delay: 600.ms, duration: 500.ms),

                            const SizedBox(height: 20),

                            // Continue as guest button
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  FadePageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Continue as guest',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ).animate().fadeIn(delay: 700.ms, duration: 500.ms),

                            const SizedBox(height: 20),

                            // Register button to redirect to Register page
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  FadePageRoute(
                                    builder: (context) => const RegisterPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Don\'t have an account? Register',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ).animate().fadeIn(delay: 800.ms, duration: 500.ms),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        // Back button
        SafeArea(
          child: Opacity(
            opacity: 1,
            child: Container(
              margin: const EdgeInsets.only(left: 25, top: 25),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                color: Colors.black54,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    FadePageRoute(
                      builder: (context) => const LandingPage(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
