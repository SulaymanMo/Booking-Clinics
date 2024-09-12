import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/input.dart';
import '../../../../core/constant/const_color.dart';
import 'package:booking_clinics/core/constant/extension.dart';

class EditItem extends StatelessWidget {
  const EditItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Flexible(child: Input(hint: "First Name")),
            SizedBox(width: 3.w),
            const Flexible(child: Input(hint: "Last Name")),
          ],
        ),
        SizedBox(height: 3.w),
        const Input(hint: "Phone Number"),
        SizedBox(height: 3.w),
        ElevatedButton(
          onPressed: () {},
          child: Text("Change"),
        ),
      ],
    );
  }
}
