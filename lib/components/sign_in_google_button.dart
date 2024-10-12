import 'package:flutter/material.dart';
import 'package:ginkhaoyang/utils/app_colors.dart';
import 'package:ginkhaoyang/utils/app_styles.dart';

class SignInGoogleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double? width;

  const SignInGoogleButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          backgroundColor: AppColors.whiteColor,  // White background for Google button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),  // Rounded corners
            side: const BorderSide(color: AppColors.mainBlueColor),  // Optional: Add border
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google.png',  // Path to Google icon asset
              height: 24.0,
              width: 24.0,
            ),
            const SizedBox(width: 12.0),  // Space between the icon and the text
            Text(
              buttonText,
              style: hindMaduraiStyle.copyWith(
                fontSize: 18,
                color: AppColors.mainBlueColor,  // Blue text color
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
