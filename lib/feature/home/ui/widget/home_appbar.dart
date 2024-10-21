import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/dropdown.dart';
import 'package:booking_clinics/core/constant/extension.dart';

class UpperAppBar extends StatelessWidget {
  const UpperAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text("Location", style: context.regular14),
        subtitle: Wrap(
          spacing: 2.w,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: const [
            Icon(Iconsax.location5),
            DropDown(
              titles: ["Cairo, EGY", "Settle, USA"],
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          style: context.theme.iconButtonTheme.style,
          icon: const Icon(Iconsax.notification5),
        ),
      ),
    );
  }
}
