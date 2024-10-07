import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller; // Ensure type is set for controller
  final String hintText;
  final bool obscureText;
  final double? width; // Optional width parameter

  const InputTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.width, // Add the optional width parameter
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        width: width ??
            double.infinity, // Use provided width or default to full width
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500]),
          ),
        ),
      ),
    );
  }
}
