import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper/logout_btn_sheet.dart';
import '../widget/custom_expansion.dart';
import '../../../../core/common/profile_image.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:booking_clinics/core/constant/const_color.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.25),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          children: [
            SizedBox(height: 2.h),
            Text("Profile", style: context.semi20),
            SizedBox(height: 4.h),
            const ProfileImage(),
            SizedBox(height: 2.h),
            Text("Sulayman Mo Ali", style: context.bold16),
            SizedBox(height: 0.5.h),
            Text(
              "+20 1026520786",
              style: context.regular14?.copyWith(
                color: ConstColor.icon.color,
              ),
            ),
            SizedBox(height: 4.h),
            const CustomExpansionList(),
            ListTile(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const LogoutBottomSheet();
                  },
                );
                // showLogoutBtnSheet(context);
              },
              title: Text(
                "Log Out",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 2.w),
              leading: const Icon(Icons.logout_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
