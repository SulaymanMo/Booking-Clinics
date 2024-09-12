import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

TextTheme darkTextTheme() {
  return TextTheme(
    // * _____ Headline [semi20]-[bold18]-[bold16] _____ * //
    headlineLarge: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: ConstColor.secondary.color,
    ),
    headlineMedium: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      color: ConstColor.secondary.color,
    ),
    headlineSmall: TextStyle(
      fontSize: 16.sp,
      letterSpacing: 0.2,
      fontWeight: FontWeight.bold,
      color: ConstColor.secondary.color,
    ),
    // * _____ Title [semi16]-[medium16]-[bold14] _____ * //
    titleLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: ConstColor.secondary.color,
    ),
    titleMedium: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: ConstColor.secondary.color,
    ),
    titleSmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: ConstColor.secondary.color,
    ),
    // * _____ Body [semi14]-[medium14]-[regular14] _____ * //
    bodyLarge: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: ConstColor.secondary.color,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: ConstColor.secondary.color,
    ),
    bodySmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: ConstColor.secondary.color,
    ),
    // * _____ Label [bold12]-[regular12] _____ * //
    labelLarge: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
      color: ConstColor.secondary.color,
    ),
    labelMedium: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: ConstColor.secondary.color,
    ),
  );
}
