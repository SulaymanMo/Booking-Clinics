import 'package:booking_clinics/core/constant/extension.dart';
import 'package:booking_clinics/feature/Auth/Ui/widgets/custom_elevated_button.dart';
import 'package:booking_clinics/feature/Auth/Ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../data/firebase_auth.dart';
import '../widgets/logo_header.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const LogoHeader(),
              Text(
                textAlign: TextAlign.center,
                "Forget Password?",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 2.h),
              Text(
                "Enter your Email, we will send you a verification code.",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff6B7280),
                    fontSize: 15.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 3.h),
              CustomTextFormField(
                controller: _emailController,
                preIcon: SvgPicture.asset("assets/icons/sms.svg"),
                hint: "Your Email",
              ),
              SizedBox(height: 3.h),
              _isLoading
                  ? const CircularProgressIndicator()
                  : CustomElevatedButton(
                      title: "Verify",
                      onPressed: _resetPassword,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      _authService
          .resetPassword(_emailController.text.trim())
          .then((_) => context.nav.pop());
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password Reset Email Sent'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
}
