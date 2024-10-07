import 'package:flutter/material.dart';
import 'package:ginkhaoyang/components/login_button.dart';
import 'package:ginkhaoyang/components/register_button.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ginkhaoyang/utils/fade_page_route.dart';
import 'package:ginkhaoyang/pages/login_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a constant width to match the button width
    const double contentWidth = 300.0;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFB9A1C), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20), // Space at the top
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/images/main_logo.png',
                    width: 250,
                    height: 250,
                    fit: BoxFit.contain,
                  ).animate().fadeIn(duration: 500.ms, delay: 300.ms),
                  const SizedBox(height: 70),
                  // Align the text and set the same width as the button
                  Center(
                    child: SizedBox(
                      width:
                          contentWidth, // Set fixed width for text and buttons
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome!',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )
                              .animate()
                              .fadeIn(duration: 500.ms, delay: 300.ms)
                              .moveY(begin: 50, end: 0),
                          const SizedBox(height: 15),
                          const Text(
                            'Satisfy your hunger with just a few taps. Sign in to get started!',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          )
                              .animate()
                              .fadeIn(duration: 500.ms, delay: 400.ms)
                              .moveY(begin: 50, end: 0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Align the login and register buttons
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Hero(
                        tag: 'loginButton',
                        child: SizedBox(
                          width: contentWidth,
                          child: LoginButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(FadePageRoute(
                                builder: (context) => const LoginPage(),
                              ));
                            },
                          ),
                        ),
                      ),
                    ).animate().fadeIn(duration: 500.ms, delay: 300.ms),
                    const SizedBox(height: 16),
                    Center(
                      child: SizedBox(
                        width: contentWidth, // Set fixed width for the button
                        child: RegisterButton(
                          onPressed: () {
                            // Add register action
                          },
                        ),
                      ),
                    ).animate().fadeIn(duration: 500.ms, delay: 300.ms),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextButton(
                onPressed: () {
                  // Add continue as guest action
                },
                child: const Text(
                  'Continue as a guest',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ).animate().fadeIn(duration: 500.ms, delay: 300.ms),
          ],
        ),
      ),
    );
  }
}
