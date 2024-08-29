import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/const_color.dart';
import '../../../../core/constant/const_string.dart';

class ButtomNavBtn extends StatelessWidget {
  const ButtomNavBtn({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
      height: 8.5.h,
      color: Colors.white,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.dark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          ConstString.bookAppointment,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
