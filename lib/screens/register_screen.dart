import 'package:flutter/material.dart';
import 'package:ginkhaoyang/screens/login_screen.dart';
import 'package:ginkhaoyang/utils/app_colors.dart';
import 'package:ginkhaoyang/utils/app_styles.dart';
import 'package:ginkhaoyang/components/sign_in_google_button.dart';
import 'package:ginkhaoyang/components/confusing_filled_button.dart';
import 'package:ginkhaoyang/utils/responsive_widget.dart';
import 'package:ginkhaoyang/components/toggle_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isMerchantSelected = true; // To keep track of the selected button
  bool isPasswordObscured = true; // For Password
  bool isConfirmPasswordObscured = true; // For Confirm Password

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
                              image: AssetImage(
                                  'assets/images/backgroundimg.jpg'), // Ensure this path is correct
                              fit: BoxFit
                                  .cover, // Adjust this based on your requirement
                            ),
                          ),
                        ),
                        // Black overlay
                        Container(
                          height: height,
                          color: Colors.black
                              .withOpacity(0.5), // Adjust the opacity as needed
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
                        SizedBox(height: height * 0.09),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Register',
                                style: montserratStyle.copyWith(
                                  fontSize: 34.0,
                                  color: AppColors.blueDarkColor,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          'New here? Create an account to start exploring and enjoying all the features we have to offer!',
                          style: catamaranStyle.copyWith(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor,
                          ),
                        ),
                        SizedBox(
                            height: height *
                                0.032), // Reduced size to make room for buttons

                        //User Type
                        // Adding the toggle buttons above the email box
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal:
                                  16.0), // Match padding of other fields
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                // Make each button expand equally
                                child: ToggleButton(
                                  text: 'Merchant',
                                  isSelected: isMerchantSelected,
                                  onPressed: () {
                                    setState(() {
                                      isMerchantSelected = true;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(
                                  width: 10), // Spacing between buttons
                              Expanded(
                                // Make each button expand equally
                                child: ToggleButton(
                                  text: 'Customer',
                                  isSelected: !isMerchantSelected,
                                  onPressed: () {
                                    setState(() {
                                      isMerchantSelected = false;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                            height:
                                height * 0.04), // Adjust this space as needed

                        // Email box
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0), // Define your padding value
                          child: Text(
                            'Email',
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
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 16.0), // Added horizontal padding
                              border: InputBorder.none,
                              hintText: 'Enter Email',
                              hintStyle: hindMaduraiStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blueDarkColor.withOpacity(0.5),
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.012),
                        // Row containing first name and last name
                        Row(
                          children: [
                            // First Name box
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'First name',
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
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0),
                                        border: InputBorder.none,
                                        hintText: 'Enter First name',
                                        hintStyle: hindMaduraiStyle.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blueDarkColor
                                              .withOpacity(0.5),
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                width:
                                    16.0), // Adjust spacing between first name and last name
                            // Last Name box
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'Last name',
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
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0),
                                        border: InputBorder.none,
                                        hintText: 'Enter Last name',
                                        hintStyle: hindMaduraiStyle.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blueDarkColor
                                              .withOpacity(0.5),
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: height * 0.01),

                        // Telephone number box
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0), // Define your padding value
                          child: Text(
                            'Phone number',
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
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 16.0), // Added horizontal padding
                              border: InputBorder.none,
                              hintText: 'Enter Phone number',
                              hintStyle: hindMaduraiStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blueDarkColor.withOpacity(0.5),
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.01),
                        // Row containing password fields
                        Row(
                          children: [
                            // Password box
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                      obscureText:
                                          isPasswordObscured, // Use the password variable
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 12.0,
                                          horizontal: 16.0,
                                        ),
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isPasswordObscured =
                                                  !isPasswordObscured; // Toggle password visibility
                                            });
                                          },
                                          icon: Icon(
                                            isPasswordObscured
                                                ? Icons
                                                    .visibility // Show icon when obscured
                                                : Icons
                                                    .visibility_off, // Hide icon when visible
                                            color: AppColors
                                                .blueDarkColor, // Adjust icon color as needed
                                          ),
                                        ),
                                        hintText: 'Enter Password',
                                        hintStyle: hindMaduraiStyle.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blueDarkColor
                                              .withOpacity(0.5),
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                width: 16.0), // Adjust spacing if needed

                            // Password Confirmation box
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'Confirm Password',
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
                                      obscureText:
                                          isConfirmPasswordObscured, // Use the confirm password variable
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 12.0,
                                          horizontal: 16.0,
                                        ),
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isConfirmPasswordObscured =
                                                  !isConfirmPasswordObscured; // Toggle confirm password visibility
                                            });
                                          },
                                          icon: Icon(
                                            isConfirmPasswordObscured
                                                ? Icons
                                                    .visibility // Show icon when obscured
                                                : Icons
                                                    .visibility_off, // Hide icon when visible
                                            color: AppColors
                                                .blueDarkColor, // Adjust icon color as needed
                                          ),
                                        ),
                                        hintText: 'Confirm Password',
                                        hintStyle: hindMaduraiStyle.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blueDarkColor
                                              .withOpacity(0.5),
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // Wrapping the InkWell with Center widget
                        Center(
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(16.0),
                            child: Ink(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 18.0),
                              child: ConfusingFilledButton(
                                onPressed: () {},
                                buttonText: 'Sign up',
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
                            buttonText: 'Sign up with Google',
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
                                "Already have an account?",
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
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          const LoginScreen(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sign In',
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
