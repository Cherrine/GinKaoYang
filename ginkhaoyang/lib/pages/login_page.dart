import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ginkhaoyang/pages/landing_page.dart';
import 'package:ginkhaoyang/utils/fade_page_route.dart';
import 'package:ginkhaoyang/components/input_textfield.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double contentWidth = 350.0;

    // Controllers for the input fields
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

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
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: contentWidth),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 150),
                        Text(
                          'Login',
                          style: GoogleFonts.cabin(
                            // Custom font style for 'Login'
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        )
                            .animate()
                            .fadeIn(duration: 500.ms, delay: 300.ms)
                            .moveX(begin: 50, end: 0),
                        const SizedBox(height: 15),
                        Text(
                          'Welcome back! Let\'s have a meal today.',
                          style: GoogleFonts.cabin(
                            fontSize: 18,
                            color: Colors.black45,
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 500.ms, delay: 300.ms)
                            .moveX(begin: 50, end: 0),
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
                          onPressed: () {
                            // Implement login logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFB9A1C),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  16, // You can adjust the font size as needed
                            ),
                          ),
                        ).animate().fadeIn(delay: 500.ms, duration: 500.ms),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              FadePageRoute(
                                builder: (context) => const LandingPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Back to Home',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ).animate().fadeIn(delay: 600.ms, duration: 500.ms),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
