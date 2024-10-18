import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ginkhaoyang/pages/home_page.dart';
import 'package:ginkhaoyang/pages/landing_page.dart';
import 'package:ginkhaoyang/utils/fade_page_route.dart';
import 'package:ginkhaoyang/components/input_textfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Auth for login
import 'package:cloud_firestore/cloud_firestore.dart'; // For fetching user info
import 'helloworld_page.dart';
import 'register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordObscured = true;
  final TextEditingController emailControl = TextEditingController();
  final TextEditingController passwordControl = TextEditingController();
  final Account account = Account();

  Future<void> signInAction() async {
    String? uid = await account.login(
      emailControl.text,
      passwordControl.text,
    );
    User currentuser = User(uid!);
    await currentuser.fetchUserData();
    if (uid != null) {
      print('login');
    } else {
      print('fail');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double imageRatio = constraints.maxWidth >= 1400
              ? 0.6
              : (constraints.maxWidth >= 800 ? 0.5 : 0);

          return Row(
            children: [
              if (imageRatio > 0)
                Expanded(
                  flex: (imageRatio * 100).round(),
                  child: CommonBackground(fontSize: 48.0),
                ),
              Expanded(
                flex: ((1 - imageRatio) * 100).round(),
                child: Padding(
                  padding: EdgeInsets.all(constraints.maxWidth * 0.05),
                  child: _buildLoginForm(context),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
            _buildHeader(),
            const SizedBox(height: 50),
            _buildTextField(
                controller: emailControl,
                icon: AppIcons.usernameIcon,
                hintText: 'Enter Username'),
            const SizedBox(height: 20),
            _buildTextField(
                controller: passwordControl,
                icon: AppIcons.lockIcon,
                hintText: 'Enter Password',
                isPassword: true),
            _buildForgotPasswordLink(),
            const SizedBox(height: 20),
            _buildSignInButton(),
            const SizedBox(height: 20),
            _buildDivider(),
            const SizedBox(height: 20),
            _buildGoogleSignInButton(),
            const SizedBox(height: 20),
            _buildSignUpLink(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Let\'s Sign In!',
          style: montserratStyle.copyWith(
            fontSize: 34.0,
            fontWeight: FontWeight.w900,
            color: AppColors.blueDarkColor,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'Welcome Back! You\'ve been missed!',
          style: catamaranStyle.copyWith(
            fontSize: 18.0,
            color: AppColors.textColor,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String icon,
    required String hintText,
    bool isPassword = false,
  }) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: AppColors.whiteColor,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword ? _isPasswordObscured : false,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child:
                Image.asset(icon, width: 24, height: 24, fit: BoxFit.contain),
          ),
          suffixIcon: isPassword ? _buildPasswordVisibilityToggle() : null,
          hintText: hintText,
          hintStyle: hindMaduraiStyle.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.blueDarkColor.withOpacity(0.5),
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordVisibilityToggle() {
    return IconButton(
      icon: Icon(_isPasswordObscured ? Icons.visibility_off : Icons.visibility),
      onPressed: () =>
          setState(() => _isPasswordObscured = !_isPasswordObscured),
    );
  }

  Widget _buildForgotPasswordLink() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Forgot Password?',
          style: hindMaduraiStyle.copyWith(
            fontSize: 16.0,
            color: AppColors.mainBlueColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return Center(
      child: signinbutton.ConfusingFilledButton(
        onPressed: signInAction,
        buttonText: 'Sign In',
        width: 200.0,
      ),
    );
  }

  Widget _buildDivider() {
    return const Row(
      children: [
        Expanded(
            child:
                Divider(color: Colors.grey, thickness: 1.0, endIndent: 10.0)),
        Text("OR", style: TextStyle(color: Colors.grey, fontSize: 14.0)),
        Expanded(
            child: Divider(color: Colors.grey, thickness: 1.0, indent: 10.0)),
      ],
    );
  }

  Widget _buildGoogleSignInButton() {
    return Center(
      child: SignInGoogleButton(
        onPressed: () {},
        buttonText: 'Sign in with Google',
        width: 250,
      ),
    );
  }

  Widget _buildSignUpLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: hindMaduraiStyle.copyWith(
            fontSize: 16.0,
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context)
              .push(FadePageRoute(page: const RegisterScreen())),
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
    );
  }
}
