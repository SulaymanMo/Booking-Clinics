import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:booking_clinics/core/constant/const_string.dart';
import 'package:booking_clinics/feature/Auth/Ui/widgets/socilal_button.dart';
import 'package:booking_clinics/feature/auth/ui/widgets/logo_header.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'widgets/or_divider.dart';
import 'widgets/signup_form.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: ListView(
              children: [
                const LogoHeader(),
                Text(
                  "Create Account",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 1.5.h),
                Text(
                  "We are here to help you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff6B7280),
                      fontSize: 15.sp),
                ),
                SizedBox(height: 2.5.h),

                // Form
                const SignupForm(),

                SizedBox(height: 2.h),
                const OrDivider(),
                SizedBox(height: 2.h),
                const SocialButton(
                    iconUrl: "assets/icons/Google - Original.svg",
                    title: "Continue with Google"),
                SizedBox(height: 1.h),
                const SocialButton(
                    iconUrl: "assets/icons/_Facebook.svg",
                    title: "Continue with Facebook"),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Do you have an account ? ",
                      style: TextStyle(color: Color(0xff6B7280), fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.signin);
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: MyColors.blue,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

