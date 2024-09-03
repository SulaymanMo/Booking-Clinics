import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
        cursorColor: Color(0xff6B7280),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            child: preIcon,
          ),
          filled: true,
<<<<<<< HEAD
          //contentpadding:EdgeInsetsDirectional.all(10)
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          prefixIconConstraints: BoxConstraints(minHeight: 25, minWidth: 25),
=======
          // contentPadding: EdgeInsets.symmetric(horizontal: 10),
          // prefixIconConstraints: BoxConstraints(minHeight: 25, minWidth: 25),
>>>>>>> 725db903eff13a083e8f04b86791ea3ff42ef68c
          prefixIconColor: Color(0xff9CA3AF),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14, color: Color(0xff9CA3AF)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            //borderSide: BorderSide(width: 1.0, color: Color(0xff9CA3AF)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2.0, color: MyColors.dark),
          ),
        ),
      ),
    );
  }
}
