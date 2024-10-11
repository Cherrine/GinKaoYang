import 'package:flutter/material.dart';
import 'package:ginkhaoyang/utils/app_colors.dart';
import 'package:ginkhaoyang/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double? width;

  const CustomButton({
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
          backgroundColor: AppColors.mainBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),  // Rounded corners
          ),
        ),
        child: Text(
          buttonText,
          style: hindMaduraiStyle.copyWith(
            fontSize: 18,
            color: Colors.white,
            shadows: [
              const Shadow(
                blurRadius: 3.0,
                color: Colors.black45,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
