import 'package:flutter/material.dart';
import '../constant/const_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.color = MyColors.dark,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(vertical: 12),
    this.textColor = Colors.white,
    this.textSize = 16,
    this.height,
    this.borderRadius = 15,
  });

  final String text;
  final Color? textColor, color;
  final double? textSize, height, borderRadius;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius!),
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(borderRadius!),
        child: Container(
          width: double.infinity,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
