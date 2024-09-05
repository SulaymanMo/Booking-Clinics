import 'package:sizer/sizer.dart';
import '../common/custom_button.dart';
import '../constant/const_color.dart';
import 'package:flutter/material.dart';
import 'package:booking_clinics/core/constant/extension.dart';

PersistentBottomSheetController customBtnSheet(BuildContext context) {
  return showBottomSheet(
    showDragHandle: true,
    context: context,
    builder: (_) {
      return Padding(
        padding: EdgeInsets.only(
          left: 4.w,
          right: 4.w,
          bottom: 2.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Logout", style: context.semi20),
            Divider(color: ConstColor.secondary.color, height: 4.h),
            Text(
              "Are you sure you want to log out?",
              style: context.semi16?.copyWith(
                color: ConstColor.icon.color,
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                Flexible(
                  child: CustomButton(
                    text: 'Cancel',
                    textColor: Colors.black,
                    color: ConstColor.secondary.color,
                    borderRadius: 3.5.w,
                    textSize: context.bold14?.fontSize,
                  ),
                ),
                SizedBox(width: 2.w),
                Flexible(
                  child: CustomButton(
                    text: 'Yes, Logout',
                    borderRadius: 3.5.w,
                    textSize: context.bold14?.fontSize,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
