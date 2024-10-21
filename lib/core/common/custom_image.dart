import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../constant/images_path.dart';

class CustomImage extends StatelessWidget {
  final String? image;
  final Widget? errorWidget;
  final double? borderRadius;
  final double? width, height;
  final String? errorImage;
  const CustomImage({
    super.key,
    this.width,
    this.height,
    this.errorImage,
    this.errorWidget,
    this.borderRadius,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 20.w),
      child: CachedNetworkImage(
        imageUrl: image ?? "",
        width: width ?? 20.w,
        height: height ?? 20.w,
        fit: BoxFit.cover,
        placeholder: (_, url) => SizedBox(
          height: 20.w,
          // width: double.infinity,
        ),
        errorWidget: (_, url, error) =>
            errorWidget ??
            Image.asset(
              errorImage ?? MyImages.doctorAvatar,
              fit: BoxFit.cover,
            ),
        errorListener: null,
      ),
    );
  }
}
