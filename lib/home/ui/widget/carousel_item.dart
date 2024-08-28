import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final String image;
  const CarouselItem({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 4.w),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 52.w,
                child: Text(
                  "Looking for Specialist Doctor?",
                  style: TextStyle(
                    height: 1.25,
                    fontSize: 19.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              SizedBox(
                width: 52.w,
                child: Text(
                  "Schedule an appointment with our top doctors.",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -19.w,
          left: -14.w,
          child: CircleAvatar(
            radius: 25.w,
            backgroundColor: Colors.white12,
          ),
        ),
        Positioned(
          left: 15.w,
          bottom: -18.w,
          child: CircleAvatar(
            radius: 12.w,
            backgroundColor: Colors.white12,
          ),
        ),
      ],
    );
  }
}
