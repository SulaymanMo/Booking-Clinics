import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../constant/const_color.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        CircleAvatar(
          radius: 20.w,
          backgroundColor: ConstColor.iconDark.color,
          child: Icon(Iconsax.user, size: 20.w, color: Colors.white),
        ),
        Positioned(
          right: 0,
          bottom: 7.w,
          child: Container(
            padding: EdgeInsets.all(1.2.w),
            decoration: BoxDecoration(
              color: ConstColor.main.color,
              borderRadius: BorderRadius.circular(3.w),
            ),
            child: const Icon(Icons.edit, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
