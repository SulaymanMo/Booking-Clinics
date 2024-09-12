import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.h),
        Image.asset('assets/images/logo.png', height: 66, width: 66,),
        SizedBox(height: 2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Health",
              style: TextStyle(fontSize: 20.sp, color: const Color(0xff6B7280)),
            ),
            Text("Pal", style: TextStyle(fontSize: 20.sp)),
          ],
        ),
        SizedBox(height: 3.h),
      ],
    );
  }
}
