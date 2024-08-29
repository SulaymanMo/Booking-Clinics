import 'carousel_item.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class CarouselSlider extends StatelessWidget {
  const CarouselSlider({super.key});
  static const List<String> images = [
    "assets/images/banner_1.jpg",
    "assets/images/banner_2.png",
    "assets/images/banner_3.png",
    "assets/images/banner_4.png",
    "assets/images/banner_5.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      child: CarouselView(
        elevation: 4,
        itemSnapping: true,
        shrinkExtent: 95.w,
        itemExtent: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 1.h,
          horizontal: 4.w,
        ),
        children: List.generate(
          images.length,
          (index) => CarouselItem(image: images[index]),
        ),
      ),
    );
  }
}
