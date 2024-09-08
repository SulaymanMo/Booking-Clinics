import 'package:flutter/material.dart';
import 'package:booking_clinics/core/constant/const_color.dart';

class CustomEvaulatedButton extends StatelessWidget {
      const CustomEvaulatedButton({required this.title,this.onPressed,super.key});
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.dark,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: onPressed ?? () {},
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
