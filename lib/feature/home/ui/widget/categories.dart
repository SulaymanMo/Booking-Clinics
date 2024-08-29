import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:booking_clinics/core/constant/extension.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});
  static const List<String> _images = [
    "assets/images/category_2.svg",
    "assets/images/category_3.svg",
    "assets/images/category_1.svg",
    "assets/images/category_4.svg",
    "assets/images/category_6.svg",
    "assets/images/category_8.svg",
    "assets/images/category_7.svg",
    "assets/images/category_5.svg",
  ];

  static const List<String> _categories = [
    "Dentistry",
    "Cardiology",
    "Pulmono...",
    "General",
    "Neurology",
    "Gastroen...",
    "Laborato...",
    "Vaccinat...",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 3.w,
        ),
        itemCount: _images.length,
        itemBuilder: (_, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                _images[index],
                width: 18.w,
              ),
              SizedBox(height: 0.5.h),
              Text(
                _categories[index],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.bold12,
              ),
            ],
          );
        },
      ),
    );
  }
}
