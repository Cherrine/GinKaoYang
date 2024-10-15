import 'package:flutter/material.dart';
import 'package:ginkhaoyang/utils/app_colors.dart';
import 'package:ginkhaoyang/utils/app_icons.dart';
import 'package:ginkhaoyang/utils/app_styles.dart';
import 'package:ginkhaoyang/components/sign_in_google_button.dart';
import 'package:ginkhaoyang/components/confusing_filled_button.dart';
import 'package:ginkhaoyang/helpers/reponsiveness.dart';
import 'package:ginkhaoyang/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true; // State variable for password visibility

  // Function to toggle password visibility
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : Expanded(
                    child: Stack(
                      children: [
                        Container(
                          height: height,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/backgroundimg.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: height,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        Center(
                          child: Text(
                            'GinKhaoYang',
                            style: montserratStyle.copyWith(
                              fontSize: 48.0,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                  horizontal: ResponsiveWidget.isSmallScreen(context)
                      ? height * 0.032
                      : height * 0.12,
                ),
                color: AppColors.backColor,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.17),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Let\'s',
                              style: montserratStyle.copyWith(
                                fontSize: 34.0,
                                color: AppColors.blueDarkColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextSpan(
                              text: ' Sign In!',
                              style: montserratStyle.copyWith(
                                fontWeight: FontWeight.w900,
                                color: AppColors.blueDarkColor,
                                fontSize: 34.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Sign in now to start exploring the flavors waiting for you.',
                        style: catamaranStyle.copyWith(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: height * 0.064),

                      // Username box
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Username',
                          style: hindMaduraiStyle.copyWith(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800,
                            color: AppColors.blueDarkColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.whiteColor,
                        ),
                        child: TextFormField(
                          style: hindMaduraiStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.blueDarkColor,
                            fontSize: 16.0,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 12.0, right: 12),
                              child: Image.asset(
                                AppIcons.usernameIcon,
                                width: 24,
                                height: 24,
                                fit: BoxFit.contain,
                              ),
                            ),
                            hintText: 'Enter Username',
                            hintStyle: hindMaduraiStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.blueDarkColor.withOpacity(0.5),
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.012),

                      // Password box
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Password',
                          style: hindMaduraiStyle.copyWith(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800,
                            color: AppColors.blueDarkColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),

                      Container(
                        height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.whiteColor,
                        ),
                        child: TextFormField(
                          style: hindMaduraiStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.blueDarkColor,
                            fontSize: 16.0,
                          ),
                          obscureText: _obscurePassword, // Use the state variable here
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: _togglePasswordVisibility, // Toggle visibility on press
                              icon: Icon(
                                _obscurePassword ? Icons.visibility : Icons.visibility_off, // Change icon based on state
                                color: AppColors.blueDarkColor,
                              ),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 12.0, right: 12),
                              child: Image.asset(
                                AppIcons.lockIcon,
                                width: 24,
                                height: 24,
                                fit: BoxFit.contain,
                              ),
                            ),
                            hintText: 'Enter Password',
                            hintStyle: hindMaduraiStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.blueDarkColor.withOpacity(0.5),
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: height * 0.02),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text('Forgot Password?',
                            style: hindMaduraiStyle.copyWith(
                              fontSize: 16.0,
                              color: AppColors.mainBlueColor,
                              fontWeight: FontWeight.w600,
                            )),
                        ),
                      ),

                      Center(
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(16.0),
                          child: Ink(
                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                            child: ConfusingFilledButton(
                              onPressed: () {},
                              buttonText: 'Sign In',
                              width: 200.0,
                            ),
                          ),
                        ),
                      ),

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1.0,
                              endIndent: 10.0,
                            ),
                          ),
                          Text(
                            "OR",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1.0,
                              indent: 10.0,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.02),

                      Center(
                        child: SignInGoogleButton(
                          onPressed: () {},
                          buttonText: 'Sign in with Google',
                          width: 250,
                        ),
                      ),

                      SizedBox(height: height * 0.02),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: hindMaduraiStyle.copyWith(
                                fontSize: 16.0,
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 0.07),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) => const RegisterScreen(),
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Sign Up',
                                style: hindMaduraiStyle.copyWith(
                                  fontSize: 16.0,
                                  color: AppColors.mainBlueColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
