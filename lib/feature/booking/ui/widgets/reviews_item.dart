import 'package:booking_clinics/core/constant/images_path.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/common/custom_network_img.dart';
import '../../../../core/constant/const_color.dart';
import '../../../../core/constant/const_string.dart';

class ReviewsItem extends StatelessWidget {
  const ReviewsItem({
    super.key,
    this.image,
    this.name = 'Emily Anderson',
    this.rating = '4.5',
    this.review = ConstString.reviewFakeText,
  });

  final String? image;
  final String name;
  final String rating;
  final String review;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomNetworkImage(
                  imageUrl: image,
                  height: 7.5.h,
                  width: 7.5.h,
                  fallbackAsset: MyImages.boyAvatar,
                  borderRadius: 50,
                ),
                SizedBox(width: 3.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16.5.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star_rounded, color: MyColors.gold, size: 21.sp),
                        Text(rating, style: TextStyle(fontSize: 15.5.sp)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Text(
              review,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16.sp, color: MyColors.softGray),
            ),
          ],
        ),
      ),
    );
  }
}
