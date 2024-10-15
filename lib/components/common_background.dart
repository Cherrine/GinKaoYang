
import 'package:flutter/material.dart';
import 'package:ginkhaoyang/utils/app_colors.dart';
import 'package:ginkhaoyang/utils/app_styles.dart';

class CommonBackground extends StatelessWidget {
  final double fontSize;

  const CommonBackground({Key? key, this.fontSize = 48.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/backgroundimg.jpg', fit: BoxFit.cover),
        Container(color: Colors.black.withOpacity(0.5)),
        Center(
          child: Text(
            'GinKhaoYang',
            style: montserratStyle.copyWith(
              fontSize: fontSize,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
