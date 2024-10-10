import 'package:flutter/material.dart';
import 'package:ginkhaoyang/components/filled_button.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ginkhaoyang/utils/fade_page_route.dart';
import 'package:ginkhaoyang/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double buttonWidth = 140.0;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/images/backgroundimg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Center(
                child: SizedBox(
                  width: buttonWidth * 2 + 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome!',
                        style: GoogleFonts.cabin(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 500.ms, delay: 300.ms)
                          .moveY(begin: 50, end: 0),
                      const SizedBox(height: 15),
                      Text(
                        'Satisfy your hunger with just a few taps. Sign in to get started!',
                        style: GoogleFonts.cabin(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 500.ms, delay: 400.ms)
                          .moveY(begin: 50, end: 0),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(
                      tag: 'loginButton',
                      child: SizedBox(
                        width: 200,
                        child: CustomButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(FadePageRoute(
                              builder: (context) => const LoginPage(),
                            ));
                          },
                          buttonText: 'Get Started',
                        ),
                      ),
                    ).animate().fadeIn(duration: 500.ms, delay: 300.ms),
                  ],
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ],
      ),
    );
  }
}
