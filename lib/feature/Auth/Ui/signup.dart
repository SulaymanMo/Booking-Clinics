import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:booking_clinics/core/constant/const_string.dart';
import 'package:booking_clinics/feature/Auth/Ui/widgets/custom_evaulated_button.dart';
import 'package:booking_clinics/feature/Auth/Ui/widgets/custom_text_form_field.dart';
import 'package:booking_clinics/feature/Auth/Ui/widgets/socilal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

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
                SizedBox(height: 5.h),
                Image.asset('assets/images/logo.png', height: 66, width: 66),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Health",
                      style:
                          TextStyle(fontSize: 20.sp, color: Color(0xff6B7280)),
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
                    Text("Create Account",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w600)),
                    SizedBox(height: 2.h),
                    Text(
                      "We are here to help you",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6B7280),
                          fontSize: 15.sp),
                    ),
                    SizedBox(height: 2.5.h),
                    // const Input(
                    //   hint: "Your Name",
                    //   prefix:Icon(sa),
                    // ),
                    CustomTextFormField(
                        preIcon: SvgPicture.asset(
                          "assets/icons/user.svg",
                        ),
                        hint: "Your Name"),
                    SizedBox(height: 1.5.h),
                    CustomTextFormField(
                        preIcon: SvgPicture.asset("assets/icons/sms.svg"),
                        hint: "Your Email"),
                    SizedBox(height: 1.5.h),
                    CustomTextFormField(
                        preIcon: SvgPicture.asset("assets/icons/lock.svg"),
                        hint: "Password"),
                    SizedBox(height: 1.5.h),
                    const CustomEvaulatedButton(title: "Create Account"),
                      SizedBox(height: 2.h),
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
                          style:
                              TextStyle(fontSize: 16.sp, color: Color(0xff6B7280)),
                        ),
                        Expanded(
                          child: Container(
                            margin:  EdgeInsets.symmetric(horizontal: 5.w),
                            child: const Divider(color: Color(0xff6B7280)),
                          ),
                        ),
                      ],
                    ),
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
                          style:
                              TextStyle(color: Color(0xff6B7280), fontSize: 14),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.signin);
                          },
                          child:  Text(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
