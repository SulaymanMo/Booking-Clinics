import 'carousel_item.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class CarouselSlider extends StatelessWidget {
  final List<String> images;
  const CarouselSlider({required this.images, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      child: CarouselView(
        elevation: 4,
        itemSnapping: true,
        shrinkExtent: 95.w,
        itemExtent: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
        children: List.generate(
          images.length,
          (index) => CarouselItem(image: images[index]),
        ),
      ),
    );
  }
}
