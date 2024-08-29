import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    this.textColor,
    required this.title,
    this.buttonTitle = "See All",
    this.showActionButton = true,
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: textColor,
            fontSize: 19.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (showActionButton)
          TextButton(
            onPressed: onPressed ?? () {},
            child: Text(
              buttonTitle,
              style: TextStyle(
                color: textColor,
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}