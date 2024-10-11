import 'package:flutter/material.dart';
import 'package:ginkhaoyang/utils/app_colors.dart';
import 'package:ginkhaoyang/utils/app_icons.dart';
import 'package:ginkhaoyang/utils/app_styles.dart';
import 'package:ginkhaoyang/components/sign_in_google_button.dart';
import 'package:ginkhaoyang/components/filled_button.dart';
import 'package:ginkhaoyang/utils/responsive_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                            image: AssetImage('assets/images/backgroundimg.jpg'), // Ensure this path is correct
                            fit: BoxFit.cover, // Adjust this based on your requirement
                          ),
                        ),
                      ),
                      // Black overlay
                      Container(
                        height: height,
                        color: Colors.black.withOpacity(0.5), // Adjust the opacity as needed
                      ),
                      // Centered text
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
                          : height * 0.12),
                  color: AppColors.backColor,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                                  )),
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

                        //Username box
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0), // Define your padding value
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
                          width: width, // Set a width to limit the textbox size
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: AppColors.whiteColor,
                          ),
                          child: TextFormField(
                            style: hindMaduraiStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blueDarkColor,
                                fontSize: 16.0),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12),
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
                                  color:
                                      AppColors.blueDarkColor.withOpacity(0.5),
                                  fontSize: 18.0),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.012),

                        //Password box
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0), // Define your padding value
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
                          width: width, // Set a width to limit the textbox size
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
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(AppIcons.eyeIcon)),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12),
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
                                  color:
                                      AppColors.blueDarkColor.withOpacity(0.5),
                                  fontSize: 18.0),
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

                        // Wrapping the InkWell with Center widget
                        Center(
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(16.0),
                            child: Ink(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 18.0),
                              child: CustomButton(
                                onPressed: () {},
                                buttonText: 'Sign In',
                                width: 200.0, // Set width as desired
                              ),
                            ),
                          ),
                        ),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Center the elements horizontally
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey, // Set the line color
                                thickness: 1.0, // Adjust the line thickness
                                endIndent:
                                    10.0, // Space between the divider and the "OR" text
                              ),
                            ),
                            Text(
                              "OR",
                              style: TextStyle(
                                color: Colors.grey, // Match the line color
                                fontSize: 14.0, // Adjust the font size
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey, // Set the line color
                                thickness: 1.0, // Adjust the line thickness
                                indent:
                                    10.0, // Space between the "OR" text and the divider
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
                            mainAxisSize: MainAxisSize
                                .min, // Keeps the row tight to its content
                            children: [
                              Text(
                                "Don't have an account?",
                                style: hindMaduraiStyle.copyWith(
                                  fontSize: 16.0,
                                  color: AppColors
                                      .textColor, // Color for the non-clickable text
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                  width:
                                      0.07), // Space between the text and button
                              TextButton(
                                onPressed: () {
                                  // Add your SignUp onPressed logic here
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
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
