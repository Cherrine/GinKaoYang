import 'package:flutter/material.dart';

class NewLandingPage extends StatelessWidget {
  const NewLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("/images/landing_background_img.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
