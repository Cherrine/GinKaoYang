import 'package:flutter/material.dart';
import 'package:ginkhaoyang/components/filled_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: CustomButton(
          onPressed: () {
            // TODO: Add your action here
          },
          buttonText: 'Button',
        ),
      ),
    );
  }
}
