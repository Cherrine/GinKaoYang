import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;

  const InputField({
    required this.controller,
    required this.hintText,
    required this.isPassword,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[100],
        suffixIcon: isPassword
            ? IconButton(
                icon: const Icon(Icons.visibility_off),
                onPressed: () {},
              )
            : null,
      ),
    );
  }
}
