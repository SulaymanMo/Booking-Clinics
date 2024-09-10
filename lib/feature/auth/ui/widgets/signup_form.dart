import 'package:booking_clinics/core/constant/const_string.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../data/firebase_auth.dart';
import 'custom_elevated_button.dart';
import 'custom_text_form_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();

  bool _isLoading = false;
  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formState,
      child: Column(
        children: [
          CustomTextFormField(
            controller: nameController,
            preIcon: SvgPicture.asset("assets/icons/user.svg"),
            hint: "Your Name",
          ),
          SizedBox(height: 1.5.h),
          CustomTextFormField(
              controller: emailController,
              preIcon: SvgPicture.asset("assets/icons/sms.svg"),
              hint: "Your Email"),
          SizedBox(height: 1.5.h),
          CustomTextFormField(
              controller: passwordController,
              preIcon: SvgPicture.asset("assets/icons/lock.svg"),
              hint: "Password"),
          SizedBox(height: 1.5.h),
          _isLoading
              ? const CircularProgressIndicator()
              : CustomElevatedButton(
                  title: "Create Account",
                  onPressed: _signUp,
                ),
        ],
      ),
    );
  }

  void _signUp() async {
    if (formState.currentState!.validate()) {
      setState(() => _isLoading = true);

      User? user = await _authService.signUpWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      setState(() => _isLoading = false);

      if (user != null) {
        context.nav.pushNamedAndRemoveUntil(Routes.signin, (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sign Up Failed. Please try again.____'),
          ),
        );
      }
    }
  }
}
