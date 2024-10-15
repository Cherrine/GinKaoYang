import 'package:flutter/material.dart';
import 'package:ginkhaoyang/helpers/reponsiveness.dart'; // Import the ResponsiveWidget

class ToggleButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const ToggleButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double buttonWidth = ResponsiveWidget.isSmallScreen(context)
        ? MediaQuery.of(context).size.width * 0.4 // Small screen: 40% of screen width
        : MediaQuery.of(context).size.width * 0.2; // Large/Medium screen: 20% of screen width

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: buttonWidth, // Make the width responsive
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: isSelected ? Colors.black : Colors.white, // Toggle background color
          border: Border.all(color: Colors.black), // Border stays the same
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              text == "Merchant" ? Icons.store : Icons.person, // Merchant and Agent icons
              color: isSelected ? Colors.white : Colors.black, // Toggle icon color
            ),
            const SizedBox(width: 8.0), // Space between icon and text
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black, // Toggle text color
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
