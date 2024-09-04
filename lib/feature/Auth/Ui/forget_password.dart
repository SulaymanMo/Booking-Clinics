import 'package:booking_clinics/feature/Auth/Ui/widgets/custom_evaulated_button.dart';
import 'package:booking_clinics/feature/Auth/Ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              SizedBox(height: 11.h),
              Image.asset('assets/images/logo.png', height: 66, width: 66),
              SizedBox(height: 2.5.h),
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
                  Text("Forget Password?",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w600)),
                  SizedBox(height: 2.h),
                  Text(
                    "Enter your Email, we will send you a verification code.",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff6B7280),
                        fontSize: 15.sp),
                        textAlign:TextAlign.center,
                  ),
                  
                ],
              ),
              SizedBox(height: 3.h),
              CustomTextFormField(
                  preIcon: SvgPicture.asset("assets/icons/sms.svg"),
                  hint: "Your Email"),
              SizedBox(height: 3.h),
              const CustomEvaulatedButton(title: "Verify"),
              SizedBox(height: 11.h),
            ],
          ),
        ),
      ),
    );
  }
}
