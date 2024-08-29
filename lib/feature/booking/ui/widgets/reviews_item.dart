import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/const_color.dart';
import '../../../../core/constant/const_string.dart';

class ReviewsItem extends StatelessWidget {
  const ReviewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: Image(
                image: AssetImage('assets/images/card_bg.png'),
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Emily Anderson',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: MyColors.gold, size: 20),
                    Text(
                      '4.5',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          ConstString.reviewFakeText,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16.sp,
            height: 1.5,
            color: MyColors.softGray,
          ),
        ),
      ],
    );
  }
}
