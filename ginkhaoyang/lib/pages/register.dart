import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Auth for registration
import 'package:ginkhaoyang/services/Account.dart'; // Account model
import 'package:ginkhaoyang/services/AppUser.dart'; // Renamed User model to AppUser
import '../services/Account.dart';
import 'login_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailControl = TextEditingController();
  final TextEditingController fNameControl = TextEditingController();
  final TextEditingController lNameControl = TextEditingController();
  final TextEditingController phoneControl = TextEditingController();
  final TextEditingController passwordControl = TextEditingController();
  final TextEditingController cPasswordControl = TextEditingController();

  bool isMerchantSelected = true;
  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;

  final Account account = Account();

  Future<void> signUpAction() async {
    Timestamp createdAt = Timestamp.now();
    if (passwordControl.text != cPasswordControl.text) {
      print("passwords not match");
      return;
    }

    int result = await account.register(
      emailControl.text,
      passwordControl.text,
      fNameControl.text,
      lNameControl.text,
      phoneControl.text,
      isMerchantSelected,
      createdAt,
    );
    if (result == 0) {
      print('reg');
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
                  child: const CommonBackground(fontSize: 48.0),
                ),
              Expanded(
                flex: ((1 - imageRatio) * 100).round(),
                child: Padding(
                  padding: EdgeInsets.all(constraints.maxWidth * 0.05),
                  child: _buildRegisterForm(context),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildRegisterForm(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            const SizedBox(height: 20),
            _buildSubtitle(),
            const SizedBox(height: 20),
            _buildToggleButtons(),
            const SizedBox(height: 20),
            _buildTextField(
                label: 'Email', hint: 'Enter Email', controller: emailControl),
            const SizedBox(height: 10),
            _buildNameFields(),
            const SizedBox(height: 10),
            _buildTextField(
                label: 'Phone number',
                hint: 'Enter Phone number',
                controller: phoneControl),
            const SizedBox(height: 10),
            _buildPasswordFields(),
            const SizedBox(height: 20),
            _buildSignUpButton(),
            const SizedBox(height: 20),
            _buildDivider(),
            const SizedBox(height: 20),
            _buildGoogleSignUpButton(),
            const SizedBox(height: 20),
            _buildSignInLink(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Register',
      style: montserratStyle.copyWith(
        fontSize: 34.0,
        fontWeight: FontWeight.w800,
        color: AppColors.blueDarkColor,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      'New here? Create an account to start exploring!',
      style: catamaranStyle.copyWith(
        fontSize: 18.0,
        color: AppColors.textColor,
      ),
    );
  }

  Widget _buildNameFields() {
    return Row(
      children: [
        Expanded(
            child: _buildTextField(
                label: 'First name',
                hint: 'Enter First name',
                controller: fNameControl)),
        const SizedBox(width: 10),
        Expanded(
            child: _buildTextField(
                label: 'Last name',
                hint: 'Enter Last name',
                controller: lNameControl)),
      ],
    );
  }

  Widget _buildPasswordFields() {
    return Row(
      children: [
        Expanded(
          child: _buildTextField(
            label: 'Password',
            hint: 'Enter Password',
            isPassword: true,
            obscureText: isPasswordObscured,
            controller: passwordControl,
            onToggleVisibility: () =>
                setState(() => isPasswordObscured = !isPasswordObscured),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildTextField(
            label: 'Confirm Password',
            hint: 'Confirm Password',
            isPassword: true,
            obscureText: isConfirmPasswordObscured,
            controller: cPasswordControl,
            onToggleVisibility: () => setState(
                () => isConfirmPasswordObscured = !isConfirmPasswordObscured),
          ),
        ),
      ],
    );
  }

  Widget _buildToggleButtons() {
    return Row(
      children: [
        Expanded(
          child: ToggleButton(
            text: 'Merchant',
            isSelected: isMerchantSelected,
            onPressed: () => setState(() => isMerchantSelected = true),
          ),
        ),
        const SizedBox(width: 10), // Space between buttons
        Expanded(
          child: ToggleButton(
            text: 'Customer',
            isSelected: !isMerchantSelected,
            onPressed: () => setState(() => isMerchantSelected = false),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: hindMaduraiStyle.copyWith(
            fontSize: 18.0,
            fontWeight: FontWeight.w800,
            color: AppColors.blueDarkColor,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: AppColors.whiteColor,
          ),
          child: TextFormField(
            controller: controller,
            obscureText: isPassword ? obscureText : false,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              border: InputBorder.none,
              hintText: hint,
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: onToggleVisibility,
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return Center(
      child: signupbutton.ConfusingFilledButton(
        onPressed: signUpAction,
        buttonText: 'Sign up',
        width: 200.0,
      ),
    );
  }

  Widget _buildGoogleSignUpButton() {
    return Center(
      child: SignInGoogleButton(
        onPressed: () {},
        buttonText: 'Sign up with Google',
        width: 250,
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

  Widget _buildSignInLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: hindMaduraiStyle.copyWith(
            fontSize: 16.0,
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context)
              .push(FadePageRoute(page: const LoginScreen())),
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
    );
  }
}
