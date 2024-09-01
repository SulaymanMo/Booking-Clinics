import 'package:booking_clinics/core/common/custom_button.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/common/basic_appbar.dart';
import '../../../../core/common/section_heading.dart';
import '../../../../core/constant/const_color.dart';
import '../../../../core/constant/const_string.dart';
import '../widgets/achievement_column.dart';
import '../widgets/reviews_item.dart';
import '../widgets/rounded_doctor_card.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: 'Doctor Details',
        actionIcon: Icons.favorite_border,
        onActionPressed: () {},
      ),
      body: Container(
        width: context.mediaQuery.size.width,
        height: context.mediaQuery.size.height,
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        color: Colors.white,
        child: ListView(
          children: [
            // Doctor Card
            const RoundedDoctorCard(),
            SizedBox(height: 2.h),
            // Achievements Row
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AchievementColumn(),
                AchievementColumn(),
                AchievementColumn(),
                AchievementColumn(),
              ],
            ),
            SizedBox(height: 2.h),
            // About me
            const SectionHeading(title: 'About me', showActionButton: false),
            SizedBox(height: 1.h),
            Text(
              ConstString.aboutMeFakeText,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15.sp, color: MyColors.softGray),
            ),
            SizedBox(height: 2.h),

            // Working Time
            const SectionHeading(
                title: 'Working Time', showActionButton: false),
            SizedBox(height: 1.h),
            Text(
              ConstString.workingTimeFakeText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15.sp, color: MyColors.softGray),
            ),
            const SizedBox(height: 20),

            // Reviews
            const SectionHeading(title: 'Reviews'),
            SizedBox(height: 1.h),
            const ReviewsItem(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: CustomButton(
          text: 'Book Appointment',
          height: 15.w,
          color: MyColors.dark,
          textColor: Colors.white,
          textSize: 16.sp,
          padding: EdgeInsets.zero,
          onTap: () {},
          borderRadius: 40,
        ),
      ),
    );
  }
}
