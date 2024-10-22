import 'package:booking_clinics/core/common/custom_button.dart';
import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:booking_clinics/core/constant/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class AppointmentDialog extends StatelessWidget {
  final String doctorName;

  final String appointmentDate;
  final String appointmentTime;

  const AppointmentDialog({
    super.key,
    required this.doctorName,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.h),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success Image
            SvgPicture.asset(MyImages.successDialog, height: 35.w, width: 35.w),
            SizedBox(height: 1.5.h),
            // Congratulation Text
            Text(
              'Congratulations!',
              style: context.bold18,
            ),
            SizedBox(height: 2.h),
            // Appointment Details
            Text(
              'Your appointment with Dr. $doctorName is confirmed for $appointmentDate, at $appointmentTime.',
              textAlign: TextAlign.center,
              style: context.medium14,
            ),
            SizedBox(height: 2.h),
            // Done Button
            CustomButton(
                text: 'Done',
                borderRadius: 8.w,
                onTap: () {
                  context.nav.pop();
                  context.nav.pop();
                  // context.nav.pop();
                }),
            // Edit Appointment Link
            TextButton(
              onPressed: () => context.nav.pop(),
              child: Text(
                'Edit your appointment',
                style: context.medium14?.copyWith(
                  color: context.theme.brightness == Brightness.dark
                      ? ConstColor.primary.color
                      : ConstColor.textBtn.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
