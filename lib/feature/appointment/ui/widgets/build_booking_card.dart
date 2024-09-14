import 'package:booking_clinics/core/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constant/const_color.dart';

Widget buildBookingCard(
  BuildContext context, {
  required String date,
  required String doctorName,
  required String specialization,
  required String clinic,
  required String imageUrl,
  required Widget buttons,
}) {
  return Card(
    child: Padding(
      padding: EdgeInsets.all(3.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date, style: context.semi14),
          Divider(height: 3.h),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(3.w),
                child: Image.asset(
                  imageUrl,
                  width: 35.w,
                  height: 35.w,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Doctor Name
                      Text(
                        doctorName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.bold16,
                      ),
                      SizedBox(height: 2.w),
                      // Specialization
                      Text(
                        specialization,
                        style: context.regular14,
                      ),
                      SizedBox(height: 1.w),
                      // Clinic
                      Text(
                        clinic,
                        style: const TextStyle(
                          color: MyColors.softGray,
                          // fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(height: 3.h),
          buttons,
        ],
      ),
    ),
  );
}
