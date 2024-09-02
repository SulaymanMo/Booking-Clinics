import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:flutter/material.dart';

class Customtextformfield extends StatelessWidget {
  Customtextformfield(
      {required this.preIcon, required this.hint, this.onChange, super.key});
  String hint;
  Icon? preIcon;
  Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      cursorColor: primary,
      decoration: InputDecoration(
        prefixIcon: preIcon,
        prefixIconColor: Color(0xff9CA3AF),
        hintText: hint,
        hintStyle: TextStyle(fontSize: 14, color: Color(0xff9CA3AF)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1.0, color: Color(0xff9CA3AF)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: Color(0xffA4CFC3)),
        ),
      ),
    );
  }
}
