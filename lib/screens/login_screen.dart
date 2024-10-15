import 'package:flutter/material.dart';
import 'package:ginkhaoyang/utils/app_colors.dart';
import 'package:ginkhaoyang/utils/app_icons.dart';
import 'package:ginkhaoyang/utils/app_styles.dart';
import 'package:ginkhaoyang/components/sign_in_google_button.dart';
import 'package:ginkhaoyang/components/confusing_filled_button.dart';
import 'package:ginkhaoyang/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordObscured = true;

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
                Expanded(flex: (imageRatio * 100).round(), child: _buildBackgroundImage()),
              Expanded(
                flex: ((1 - imageRatio) * 100).round(),
                child: Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  child: _buildLoginForm(context),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/backgroundimg.jpg', fit: BoxFit.cover),
        Container(color: Colors.black.withOpacity(0.5)),
        Center(child: Text('GinKhaoYang', style: montserratStyle.copyWith(fontSize: 48.0, color: AppColors.whiteColor, fontWeight: FontWeight.w800))),
      ],
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 90),
          Text('Let\'s Sign In!', style: montserratStyle.copyWith(fontSize: 34.0, fontWeight: FontWeight.w900, color: AppColors.blueDarkColor)),
          SizedBox(height: 30),
          Text('Welcome Back! You\'ve been missed!', style: catamaranStyle.copyWith(fontSize: 18.0, color: AppColors.textColor)),
          SizedBox(height: 50),
          _buildTextField(icon: AppIcons.usernameIcon, hintText: 'Enter Username'),
          SizedBox(height: 20),
          _buildTextField(icon: AppIcons.lockIcon, hintText: 'Enter Password', isPassword: true),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text('Forgot Password?', style: hindMaduraiStyle.copyWith(fontSize: 16.0, color: AppColors.mainBlueColor, fontWeight: FontWeight.w600)),
            ),
          ),
          SizedBox(height: 20),
          Center(child: ConfusingFilledButton(onPressed: () {}, buttonText: 'Sign In', width: 200.0)),
          SizedBox(height: 20),
          _buildDivider(), 
          SizedBox(height: 20),
          Center(child: SignInGoogleButton(onPressed: () {}, buttonText: 'Sign in with Google', width: 250)),
          SizedBox(height: 20),
          _buildSignUpLink(context),
        ],
      ),
    );
  }

  Widget _buildTextField({required String icon, required String hintText, bool isPassword = false}) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: AppColors.whiteColor,
      ),
      child: TextFormField(
        obscureText: isPassword ? _isPasswordObscured : false,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0), child: Image.asset(icon, width: 24, height: 24, fit: BoxFit.contain)),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(_isPasswordObscured ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _isPasswordObscured = !_isPasswordObscured),
                )
              : null,
          hintText: hintText,
          hintStyle: hindMaduraiStyle.copyWith(fontWeight: FontWeight.w400, color: AppColors.blueDarkColor.withOpacity(0.5), fontSize: 18.0),
        ),
      ),
    );
  }

  Widget _buildSignUpLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?", style: hindMaduraiStyle.copyWith(fontSize: 16.0, color: AppColors.textColor, fontWeight: FontWeight.w600)),
        TextButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterScreen())),
          child: Text('Sign Up', style: hindMaduraiStyle.copyWith(fontSize: 16.0, color: AppColors.mainBlueColor, fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return const Row(
      children: [
        Expanded(child: Divider(color: Colors.grey, thickness: 1.0, endIndent: 10.0)),
        Text("OR", style: TextStyle(color: Colors.grey, fontSize: 14.0)),
        Expanded(child: Divider(color: Colors.grey, thickness: 1.0, indent: 10.0)),
      ],
    );
  }
}
