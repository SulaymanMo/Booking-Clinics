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
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 26, 20, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success Image
            SvgPicture.asset(MyImages.successDialog, height: 35.w, width: 35.w),
            SizedBox(height: 4.w),
            // Congratulation Text
            Text(
              'Congratulations!',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: MyColors.dark),
            ),
            SizedBox(height: 3.w),
            // Appointment Details
            Text(
              'Your appointment with Dr. $doctorName is confirmed for $appointmentDate, at $appointmentTime.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.5.sp, color: Colors.grey),
            ),
            SizedBox(height: 5.w),
            // Done Button
            CustomButton(
              text: 'Done',
              borderRadius: 30,
              onTap: () {
                context.nav.pop();
                context.nav.pop();
                // context.nav.pop();
              }
            ),
            // Edit Appointment Link
            TextButton(
              onPressed: () => context.nav.pop(),
              child: Text(
                'Edit your appointment',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
