import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:booking_clinics/core/constant/const_string.dart';
import 'package:booking_clinics/feature/Auth/Ui/widgets/custom_evaulated_button.dart';
import 'package:booking_clinics/feature/Auth/Ui/widgets/custom_text_form_field.dart';
import 'package:booking_clinics/feature/Auth/Ui/widgets/socilal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

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
                SizedBox(height: 5.h),
                Image.asset('assets/images/logo.png', height: 66, width: 66),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Health",
                      style: TextStyle(
                          fontSize: 20.sp, color: const Color(0xff6B7280)),
                    ),
                    Text(
                      "Pal",
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ],
                ),
                SizedBox(height: 2.5.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Hi, Welcome Back! ",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w600)),
                    SizedBox(height: 2.h),
                    Text(
                      "Hope you’re doing fine.",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff6B7280),
                          fontSize: 15.sp),
                    ),
                    SizedBox(height: 3.h),
                    CustomTextFormField(
                        preIcon: SvgPicture.asset("assets/icons/sms.svg"),
                        hint: "Your Email"),
                    SizedBox(height: 1.5.h),
                    CustomTextFormField(
                        preIcon: SvgPicture.asset("assets/icons/lock.svg"),
                        hint: "Password"),
                    SizedBox(height: 3.h),
                    CustomEvaulatedButton(
                      title: "Sign In",
                      onPressed: () {
                        //context.nav.pushNamed(Routes.editYourProfile);
                      },
                    ),
                    SizedBox(height: 2.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            margin:  EdgeInsets.symmetric(horizontal: 5.w),
                            child: const Divider(color: Color(0xff6B7280)),
                          ),
                        ),
                        Text(
                          "Or",
                          style: TextStyle(
                              fontSize: 16.sp, color: const Color(0xff6B7280)),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            child: const Divider(color: Color(0xff6B7280)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.5.h),
                    const SocialButton(
                        iconUrl: "assets/icons/Google - Original.svg",
                        title: "Sign In with Google"),
                    SizedBox(height: 1.5.h),
                    const SocialButton(
                        iconUrl: "assets/icons/_Facebook.svg",
                        title: "Sign In with Facebook"),
                    SizedBox(height: 2.h),
                    GestureDetector(
                      onTap: () {
                          Navigator.pushNamed(context, Routes.forgetPassword);
                      },
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                            color: MyColors.blue,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account yet?",
                          style: TextStyle(
                              color: const Color(0xff6B7280), fontSize: 14.sp),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.signup);
                          },
                          child: Text(
                            " Sign up",
                            style: TextStyle(
                                color: const Color(0xff1C64F2),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    //SizedBox(height: 2.h),
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
