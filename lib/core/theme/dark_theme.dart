import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    iconTheme: IconThemeData(
      size: 22.sp,
    ),
  );
}
