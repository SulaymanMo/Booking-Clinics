import 'package:booking_clinics/core/constant/extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constant/const_string.dart';
import '../../data/firebase_auth.dart';
import 'custom_elevated_button.dart';
import 'custom_text_form_field.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({super.key});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  TextEditingController emailController = TextEditingController();
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
              controller: emailController,
              preIcon: SvgPicture.asset("assets/icons/sms.svg"),
              hint: "Your Email"),
          SizedBox(height: 1.5.h),
          CustomTextFormField(
              controller: passwordController,
              preIcon: SvgPicture.asset("assets/icons/lock.svg"),
              hint: "Password"),
          SizedBox(height: 3.h),

          _isLoading
              ? const CircularProgressIndicator()
              : CustomElevatedButton(
            title: "Create Account",
            onPressed: _signIn,
          ),

          // CustomElevatedButton(
          //   title: "Sign In",
          //   onPressed: () {
          //     context.nav.pushNamed(Routes.navRoute);
          //   },
          // ),
        ],
      ),
    );
  }
  void _signIn() async {
    if (formState.currentState!.validate()) {
      setState(() => _isLoading = true);

      User? user = await _authService.loginWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      setState(() => _isLoading = false);

      if (user != null) {
        context.nav.pushNamedAndRemoveUntil(Routes.navRoute, (route) => false);
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