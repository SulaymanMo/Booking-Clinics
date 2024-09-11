import 'package:booking_clinics/core/common/basic_appbar.dart';
import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:booking_clinics/feature/Auth/Ui/widgets/custom_congauth_dialog.dart';
import 'package:booking_clinics/feature/Auth/Ui/widgets/custom_elevated_button.dart';
import 'package:booking_clinics/feature/Auth/Ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class EditYourProfile extends StatelessWidget {
  const EditYourProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: "Fill Your Profile"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              SizedBox(height: 5.h),
              /*change photo*/
              Center(
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    CircleAvatar(
                      radius: 20.w,
                      backgroundColor: ConstColor.icon.color,
                      child:
                          Icon(Iconsax.user, size: 20.w, color: Colors.white),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 6.w,
                      child: Container(
                        padding: EdgeInsets.all(1.2.w),
                        decoration: BoxDecoration(
                          color: ConstColor.main.color,
                          borderRadius: BorderRadius.circular(3.w),
                        ),
                        child: const Icon(Icons.edit, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              /*change photo */
              SizedBox(height: 3.h),
              const CustomTextFormField(hint: "Your Name"),
              SizedBox(height: 1.5.h),
              const CustomTextFormField(hint: "Nickname"),
              SizedBox(height: 1.5.h),
              const CustomTextFormField(hint: "name@example.com"),
              SizedBox(height: 1.5.h),
              CustomTextFormField(
                hint: "Date of Birth",
                suffixIcon: SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset("assets/icons/calendar_fill.svg"),
                ),
              ),
              SizedBox(height: 1.5.h),
              const CustomTextFormField(hint: "Gender"),
              SizedBox(height: 3.h),
              CustomElevatedButton(
                title: "Save",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const CustomCongAuthDialog();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
