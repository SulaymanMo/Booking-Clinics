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
        padding: EdgeInsets.symmetric(vertical: 2.5.w, horizontal: 2.w),
        child: Row(
          children: [
            CustomNetworkImage(
              imageUrl: favorite.docImageUrl,
              fallbackAsset: MyImages.doctorAvatar,
              width: 35.w,
              height: 35.w,
              borderRadius: 3.w,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(favorite.docName, style: context.bold16)),
                      SizedBox(width: 1.w),
                      IconButton(
                        icon: const Icon(Iconsax.heart5),
                        onPressed: () => onRemove(favorite),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                  const Divider(),
                  Text(favorite.docSpeciality, style: context.medium16),
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                      const Icon(Iconsax.location4, size: 17),
                      SizedBox(width: 1.w),
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
                        const VerticalDivider(),
                        Text("${favorite.reviewsNumber} Reviews", style: context.regular14),
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
