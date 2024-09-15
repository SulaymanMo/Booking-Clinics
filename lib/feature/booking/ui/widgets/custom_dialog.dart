import 'package:booking_clinics/core/common/custom_button.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:booking_clinics/core/constant/images_path.dart';
import 'package:flutter/material.dart';
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success Image
            Image.asset(MyImages.successDialog, height: 35.w, width: 35.w),
            SizedBox(height: 2.h),
            // Congratulation Text
            Text(
              'Congratulations!',
              style: context.semi20,
            ),
            SizedBox(height: 1.h),
            // Appointment Details
            Text(
              'Your appointment with Dr. $doctorName is confirmed for $appointmentDate, at $appointmentTime.',
              textAlign: TextAlign.center,
              style: context.regular14,
            ),
            SizedBox(height: 3.h),
            // Done Button
            CustomButton(
              text: 'Done',
              borderRadius: 30,
              onTap: () => context.nav.pop(),
            ),
            // Edit Appointment Link
            SizedBox(height: 0.5.h),
            TextButton(
              onPressed: () => context.nav.pop(),
              child: const Text('Edit your appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
