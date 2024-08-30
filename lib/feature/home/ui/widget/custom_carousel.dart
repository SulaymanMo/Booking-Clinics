import 'list_item.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class CarouselSlider extends StatelessWidget {
  final List<String> images;
  const CarouselSlider({required this.images, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: CarouselView(
        elevation: 2,
        shrinkExtent: 95.w,
        itemSnapping: true,
        itemExtent: double.infinity,
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          vertical: 1.h,
          horizontal: 4.w,
        ),
        children: List.generate(
          images.length,
          (index) => ListItem(image: images[index]),
        ),
      ),
    );
  }
}
