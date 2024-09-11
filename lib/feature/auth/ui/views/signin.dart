import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:booking_clinics/core/constant/const_string.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:booking_clinics/feature/Auth/Ui/widgets/socilal_button.dart';
import 'package:booking_clinics/feature/auth/ui/widgets/logo_header.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widgets/or_divider.dart';
import '../widgets/signin_form.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
                  "Hi, Welcome Back! ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  "Hope you’re doing fine.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff6B7280),
                      fontSize: 15.sp),
                ),
                SizedBox(height: 3.h),

                const SigninForm(),

                SizedBox(height: 2.h),
                const OrDivider(),
                SizedBox(height: 2.h),
                const SocialButton(
                    iconUrl: "assets/icons/Google - Original.svg",
                    title: "Sign In with Google"),
                SizedBox(height: 1.5.h),
                const SocialButton(
                    iconUrl: "assets/icons/_Facebook.svg",
                    title: "Sign In with Facebook"),
                SizedBox(height: 2.h),
                TextButton(
                  onPressed: () => context.nav.pushNamed(Routes.forgetPassword),
                  child: Text(
                    "Forgot password?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: MyColors.blue,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 2.h),
                // Don’t have an account yet
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account yet?",
                      style: TextStyle(
                        color: const Color(0xff6B7280),
                        fontSize: 14.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.nav.pushNamed(Routes.signup),
                      child: Text(
                        " Sign up",
                        style: TextStyle(
                            color: const Color(0xff1C64F2),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}