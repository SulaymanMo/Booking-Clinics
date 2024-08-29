import 'package:flutter/material.dart';

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
      height: 100,
      child: Column(
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: const BoxDecoration(
              color: MyColors.lightGray,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: MyColors.dark),
          ),
          Text(number, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(text, style: const TextStyle(color: MyColors.softGray)),
        ],
      ),
    );
  }
}
