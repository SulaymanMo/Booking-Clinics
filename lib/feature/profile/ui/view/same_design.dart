import 'package:sizer/sizer.dart';
import '../../../../core/common/profile_image.dart';
import 'package:flutter/material.dart';
import '../widget/custom_expansion.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:booking_clinics/core/constant/const_color.dart';

class SameDesign extends StatelessWidget {
  const SameDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6.w, right: 6.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 4.h),
            Text("Profile", style: context.semi20),
            SizedBox(height: 4.h),
            const ProfileImage(),
            SizedBox(height: 2.h),
            Text("Sulayman Mo Ali", style: context.bold16),
            SizedBox(height: 0.5.h),
            Text(
              "+201026520786",
              style: context.regular14?.copyWith(
                color: ConstColor.icon.color,
              ),
            ),
            SizedBox(height: 4.h),
            const CustomExpansionList(),
          ],
        ),
      ),
    );
  }
}
