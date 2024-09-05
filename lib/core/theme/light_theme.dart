import 'dart:collection';

import 'package:booking_clinics/core/constant/const_string.dart';

import 'text_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:booking_clinics/core/constant/const_color.dart';

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: ConstColor.main.color),
    scaffoldBackgroundColor: Colors.white,
    // ! _____ AppBar _____ ! //
    appBarTheme: AppBarTheme(
      titleSpacing: 4.w,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(4.w),
        bottomRight: Radius.circular(4.w),
      )),
      iconTheme: IconThemeData(
        size: 20.sp,
        color: ConstColor.main.color,
      ),
    ),
    // ! _____ TabBar _____ ! //
    tabBarTheme: TabBarTheme(
      dividerHeight: 0,
      labelColor: Colors.white,
      tabAlignment: TabAlignment.start,
      indicatorSize: TabBarIndicatorSize.tab,
      labelPadding: EdgeInsets.symmetric(horizontal: 0.5.w),
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      // overlayColor: WidgetStateProperty.resolveWith(callback),
      indicator: ShapeDecoration(
        color: ConstColor.main.color,
        shape: StadiumBorder(
          side: BorderSide(color: ConstColor.main.color),
        ),
      ),
    ),
    // ! _____ Text Theme _____ ! //
    textTheme: textTheme(),
    fontFamily: "Inter_Light",
    // ! _____ ListTile _____ ! //
    listTileTheme: const ListTileThemeData(
      dense: true,
      contentPadding: EdgeInsets.zero,
    ),
    // ! _____ Icon _____ ! //
    iconTheme: IconThemeData(
      size: 20.sp,
      color: ConstColor.main.color,
    ),
    // ! _____ ElevatedButton _____ ! //
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    // ! _____ TextButton _____ ! //
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        foregroundColor: ConstColor.textBtn.color,
      ),
    ),
    // ! _____ Icon Button _____ ! //
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        iconSize: 20.sp,
      ),
    ),
    // ! _____ Bottom App Bar _____ ! //
    bottomAppBarTheme: BottomAppBarTheme(
      height: 6.5.h,
      // color: Colors.white,
      shape: const CircularNotchedRectangle(),
      padding: EdgeInsets.symmetric(horizontal: 4.w),
    ),
    // ! _____ Floating Button _____ ! //
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 0,
      highlightElevation: 0,
      shape: CircleBorder(),
      backgroundColor: Colors.white70,
      foregroundColor: Colors.black87,
    ),
    // ! _____ Fixed Bottom Sheet _____ ! //
    bottomSheetTheme: BottomSheetThemeData(
      constraints: BoxConstraints(
        maxHeight: 35.h,
        minHeight: 10.h,
        minWidth: double.infinity,
      ),
      backgroundColor: Colors.white,
    ),
  );
}
