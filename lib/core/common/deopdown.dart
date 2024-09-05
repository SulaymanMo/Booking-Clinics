import 'package:flutter/material.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:sizer/sizer.dart';

class DropDown extends StatelessWidget {
  final List<String> titles;
  const DropDown({required this.titles, super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: 0,
      isDense: true,
      menuWidth: 50.w,
      style: context.semi14,
      borderRadius: BorderRadius.circular(3.5.w),
      underline: const Divider(color: Colors.transparent),
      items: List.generate(
        titles.length,
        (index) => DropdownMenuItem(
          value: index,
          child: Text(titles[index]),
        ),
      ),
      onChanged: (val) {},
    );
  }
}
