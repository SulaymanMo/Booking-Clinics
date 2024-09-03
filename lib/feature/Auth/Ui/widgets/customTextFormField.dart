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
        style: TextStyle(fontSize: 15.sp,color: MyColors.dark),
        onChanged: onChange,
        cursorColor: Color(0xff6B7280),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.5.w,),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              child: preIcon,
            ),
          ),
          filled: true,
          
          //contentPadding: EdgeInsetsDirectional.all(),
          prefixIconConstraints:const  BoxConstraints(minHeight: 40, minWidth: 30),
          prefixIconColor: Color(0xff9CA3AF),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14, color: Color(0xff9CA3AF)),
          border: buildBorder(),
         enabledBorder: buildBorder(),
         focusedBorder: buildFocusedBorder(),
        
        ),
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
