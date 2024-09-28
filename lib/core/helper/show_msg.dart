import 'package:booking_clinics/core/constant/extension.dart';
import 'package:sizer/sizer.dart';
import '../constant/const_color.dart';
import 'package:flutter/material.dart';

void showMsg(
  BuildContext context, {
  required String title,
  required String msg,
  required Widget image,
}) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 35.w, height: 35.w, child: image),
            SizedBox(height: 2.h),
            Text(title, style: context.bold18),
            SizedBox(height: 1.h),
            Text(msg, textAlign: TextAlign.center, style: context.medium14),
            SizedBox(height: 4.h),
            Icon(Icons.done_outline, color: ConstColor.primary.color),
          ],
        ),
      ),
    ),
  );
}

// "assets/images/success_dialog.png"
// Your account is ready to use. You will be redirected to the Home Page in a few seconds...