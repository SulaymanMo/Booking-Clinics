import 'package:flutter/material.dart';
import '../constant/const_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.color = MyColors.dark,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(vertical: 12),
    this.textColor = Colors.black,
    this.textSize = 16,
  });

  final String text;
  final Color? textColor, color;
  final double? textSize;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: double.infinity,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w900,
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
