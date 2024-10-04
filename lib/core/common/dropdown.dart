import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:flutter/material.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:sizer/sizer.dart';

class DropDown extends StatefulWidget {
  final int? value;
  final List<String> titles;
  final void Function(int? val)? onSelect;
  const DropDown({
    super.key,
    this.onSelect,
    this.value = 0,
    required this.titles,
  });

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: widget.value,
      isDense: true,
      dropdownColor: Theme.of(context).brightness == Brightness.dark
          ? ConstColor.iconDark.color
          : null,
      menuWidth: 50.w,
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
      style: context.regular14,
      borderRadius: BorderRadius.circular(3.5.w),
      underline: const Divider(color: Colors.transparent),
      items: List.generate(
        widget.titles.length,
        (index) => DropdownMenuItem(
          value: index,
          child: Text(widget.titles[index]),
        ),
      ),
      onChanged: (val) {
        if (widget.onSelect != null) widget.onSelect!(val);
      },
    );
  }
}
