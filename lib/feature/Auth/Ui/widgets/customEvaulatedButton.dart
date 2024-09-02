import 'package:flutter/material.dart';
import 'package:booking_clinics/core/constant/const_color.dart';

class Customevaulatedbutton extends StatelessWidget {
      Customevaulatedbutton({required this.title,super.key});
  String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.dark,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(
          fontSize: 19,
          color: Colors.white,
        ),
      ),
    );
  }
}
