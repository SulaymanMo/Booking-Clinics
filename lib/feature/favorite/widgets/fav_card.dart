import 'package:booking_clinics/core/common/custom_image.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../core/common/custom_network_img.dart';
import '../../../core/constant/images_path.dart';
import '../../../data/models/favorite.dart';

class FavCard extends StatelessWidget {
  final Favorite favorite;
  final Function(Favorite) onRemove;

  const FavCard({super.key, required this.favorite, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 2.w),
        child: Row(
          children: [
            CustomImage(
              image: favorite.docImageUrl,
              width: 28.w,
              height: 28.w,
              borderRadius: 50.w,
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(favorite.docName, style: context.bold16),
                      ),
                      SizedBox(width: 1.w),
                      GestureDetector(
                        onTap: () => onRemove(favorite),
                        child: const Icon(Iconsax.heart5),
                      ),
                    ],
                  ),
                  Divider(height: 2.h),
                  Text(favorite.docSpeciality, style: context.regular14),
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                      const Icon(Iconsax.location4),
                      SizedBox(width: 2.w),
                      Flexible(
                        child: Text(
                          favorite.docAddress,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.regular14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        const Icon(Iconsax.star1, color: Colors.orangeAccent),
                        SizedBox(width: 1.w),
                        Text('${favorite.rating}', style: context.regular14),
                        VerticalDivider(width: 8.w),
                        Text("${favorite.reviewsNumber} Reviews",
                            style: context.regular14),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
