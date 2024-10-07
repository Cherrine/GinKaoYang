import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ginkhaoyang/pages/landing_page.dart';
import 'package:ginkhaoyang/utils/fade_page_route.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFB9A1C), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 100),
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ).animate().fadeIn(delay: 300.ms, duration: 500.ms),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ).animate().fadeIn(delay: 400.ms, duration: 500.ms),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        // Implement login logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text('Login'),
                    ).animate().fadeIn(delay: 500.ms, duration: 500.ms),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        // Navigate back to LandingPage with a simple fade-out transition
                        Navigator.of(context).pushReplacement(
                          FadePageRoute(
                            builder: (context) => const LandingPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Back to Home',
                        style: TextStyle(color: Colors.white),
                      ),
                    ).animate().fadeIn(delay: 600.ms, duration: 500.ms),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
