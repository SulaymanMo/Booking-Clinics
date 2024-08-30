import 'package:booking_clinics/core/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
          height: 22.h,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Sunrise Health Clinic",
                style: context.semi16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
