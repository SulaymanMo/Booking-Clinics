import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/common/rate.dart';

class ListItem extends StatelessWidget {
  final String image;
  const ListItem({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          image,
          height: 20.h,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        const Spacer(),
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
          title: Text(
            "Sunrise Health Clinic",
            style: context.semi16,
          ),
          subtitle: Text(
            "Hospital & Health Care System",
            style: context.medium14?.copyWith(
              color: ConstColor.textBtn.color,
            ),
          ),
          trailing: const Rate(),
        ),
        const Spacer(),
      ],
    );
  }
}
