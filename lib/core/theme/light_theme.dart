import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:booking_clinics/core/constant/const_color.dart';

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    iconTheme: IconThemeData(
      size: 20.sp,
      color: ConstColor.dark.color,
    ),
    // ! _____ ListTile _____ ! //
    appBarTheme: AppBarTheme(
      titleSpacing: 4.w,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        size: 20.sp,
        color: ConstColor.dark.color,
      ),
    ),
    textTheme: TextTheme(
      // ? _____ Headerline Text _____ ? //
      headlineLarge: TextStyle(
        fontSize: 40.sp,
        color: Colors.white,
      ),
      // ? _____ Body Text _____ ? //
      bodyLarge: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ),
      // ? _____ Label Text _____ ? //
      labelLarge: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w300,
      ),
    ),
    // ! _____ ListTile _____ ! //
    listTileTheme: const ListTileThemeData(
      dense: true,
      contentPadding: EdgeInsets.zero,
    ),
  );
}
