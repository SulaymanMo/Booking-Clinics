import 'package:booking_clinics/core/constant/const_string.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/dropdown.dart';
import 'package:booking_clinics/core/constant/extension.dart';

class UpperAppBar extends StatelessWidget {
  const UpperAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          "Location",
          style: context.regular14,
        ),
        subtitle: Wrap(
          spacing: 1.25.w,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Iconsax.location5,
              color: context.theme.iconTheme.color,
            ),
            const DropDown(
              titles: ["Cairo, EGY", "Settle, USA"],
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            // for testing
            context.nav.pushNamed(
              Routes.doctorDetailsRoute,
              arguments: {
                'doctorId': 'A3EOhkb1xqdJe2q1Xw4q',
                'patientName': 'Mohamed Hassan',
              },
            );
          },
          style: context.theme.iconButtonTheme.style,
          icon: const Icon(Iconsax.notification5),
        ),
      ),
    );
  }
}
