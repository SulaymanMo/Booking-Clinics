import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constant/const_color.dart';

class AchievementColumn extends StatelessWidget {
  const AchievementColumn({
    super.key,
    this.icon = Icons.people,
    this.number = '2000',
    this.text = 'patients',
  });

  final IconData icon;
  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12.h,
      child: Column(
        children: [
          Container(
            height: 7.h,
            width: 7.h,
            decoration: const BoxDecoration(
              color: MyColors.lightGray,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: MyColors.dark, size: 4.h),
          ),
          Text(number, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(text, style: const TextStyle(color: MyColors.softGray)),
        ],
      ),
    );
  }
}
