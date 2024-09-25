import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomImage extends StatelessWidget {
  final String? image;
  const CustomImage({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image ?? "",
      height: 20.h,
      fit: BoxFit.cover,
      width: double.infinity,
      placeholder: (_, url) => SizedBox(
        height: 20.h,
        width: double.infinity,
      ),
      errorWidget: (_, url, error) => Image.asset(
        "assets/images/center_2.jpg",
        fit: BoxFit.cover,
      ),
      errorListener: (val) => debugPrint('$val'),
    );
  }

}
