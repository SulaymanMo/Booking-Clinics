import 'package:booking_clinics/core/common/custom_image.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
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
      // shadowColor: Colors.black12,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImage(image: image, width: 18.w, height: 18.w),
                SizedBox(width: 3.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: context.semi16,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star_rounded,
                            color: Colors.orangeAccent),
                        Text(rating, style: context.regular14),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 1.5.h),
            Text(
              review,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: context.regular14,
            ),
          ],
        ),
      ),
    );
  }
}
