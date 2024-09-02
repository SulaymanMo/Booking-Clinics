import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:flutter/material.dart';

class Customtextformfield extends StatelessWidget {
  Customtextformfield(
      {required this.preIcon, required this.hint, this.onChange, super.key});
  String hint;
  Widget? preIcon;
  Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 60,
      child: TextFormField(
      
        onChanged: onChange,
        cursorColor: primary,
        decoration: InputDecoration(
          prefixIcon: preIcon,
          contentPadding: EdgeInsets.fromLTRB(30, 10, 10, 10),
          
          prefixIconConstraints: BoxConstraints(minHeight: 25,minWidth: 25),
          prefixIconColor: Color(0xff9CA3AF),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14, color: Color(0xff9CA3AF)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1.0, color: Color(0xff9CA3AF)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2.0, color: Color(0xffA4CFC3)),
          ),
        ),
      ),
    );
  }
}
