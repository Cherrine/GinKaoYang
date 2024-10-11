import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const SocialLoginButton({
    required this.label,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
        side: const BorderSide(color: Colors.blue),
      ),
      icon: Icon(icon, color: Colors.blue),
      label: Text(
        label,
        style: const TextStyle(color: Colors.blue),
      ),
    );
  }
}
