import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {
  final bool _currentSlide;
  const CarouselIndicator(this._currentSlide, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 2.25.w,
      // width: 3.5.w,
      width: _currentSlide ? 7.w : 2.25.w,
      margin: EdgeInsets.only(right: 2.w, bottom: 1.h),
      decoration: BoxDecoration(
        // color: Colors.white70,
        color: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? _currentSlide
                ? Colors.white
                : Colors.white70
            : _currentSlide
                ? ConstColor.iconDark.color
                : ConstColor.icon.color,
        borderRadius: BorderRadius.circular(50),
      ),
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 250),
    );
  }
}
