import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:booking_clinics/core/constant/const_color.dart';

class Input extends StatelessWidget {
  const Input({
    this.suffix,
    this.prefix,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.hint,
    this.obscureText = false,
    super.key,
  });
  final String? hint;
  final IconData? suffix;
  final IconData? prefix;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      style: context.regular14,
      onChanged: onChanged,
      controller: controller,
      onTapOutside: (val) => FocusManager.instance.primaryFocus!.unfocus(),
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        fillColor: ConstColor.secondary.color,
        hintText: hint,
        // hintText: "Find Resturants",
        prefixIcon: prefix != null
            ? Icon(
                prefix,
                size: 20.sp,
                color: ConstColor.texture.color,
              )
            : null,
        suffixIcon: suffix != null
            ? Icon(
                suffix,
                size: 20.sp,
                color: ConstColor.texture.color,
              )
            : null,
        labelStyle: context.regular14,
        hintStyle: context.textTheme.bodySmall?.copyWith(
          color: ConstColor.texture.color,
        ),
        floatingLabelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildFocusedBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 0.8.sp,
        color: Colors.black12,
      ),
      borderRadius: BorderRadius.circular(3.5.w),
    );
  }

  OutlineInputBorder buildFocusedBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 0.8.sp,
        color: Colors.deepPurple,
      ),
      borderRadius: BorderRadius.circular(3.5.w),
    );
  }
}
