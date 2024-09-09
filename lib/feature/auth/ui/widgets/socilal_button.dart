import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class SocialButton extends StatelessWidget {
  final String iconUrl;
  final String title;

  const SocialButton({
    required this.iconUrl,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xff9CA3AF), // Border color
              width: 1, // Border width
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(iconUrl),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(color: MyColors.dark, fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
