import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RegisterButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          side: const BorderSide(color: Color(0xFFFB9A1C)),
          backgroundColor: Colors.white, // Add white background
        ),
        child: const Text(
          'Register',
          style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(214, 251, 154, 28),
              shadows: [
                Shadow(
                  blurRadius: 3.0,
                  color: Colors.black12,
                  offset: Offset(0, 2),
                )
              ]),
        ),
      ),
    );
  }
}
