import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            child: const Divider(color: Color(0xff6B7280)),
          ),
        ),
        Text(
          "or",
          style: TextStyle(fontSize: 17.sp, color: const Color(0xff6B7280)),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            child: const Divider(color: Color(0xff6B7280)),
          ),
        ),
      ],
    );
  }
}