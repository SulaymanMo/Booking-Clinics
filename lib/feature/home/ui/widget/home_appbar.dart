import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/const_color.dart';
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
            SvgPicture.asset("assets/icons/location_fill.svg"),
            DropdownButton<int>(
              value: 1,
              isDense: true,
              style: context.semi14,
              underline: const Divider(color: Colors.transparent),
              items: const [
                DropdownMenuItem(
                  value: 0,
                  child: Text("Settle, USA"),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text("Egypt, Cairo"),
                ),
              ],
              onChanged: (val) {},
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: ConstColor.secondary.color,
          ),
          icon: SvgPicture.asset(
            "assets/icons/notification.svg",
            colorFilter: ColorFilter.mode(
              ConstColor.main.color,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
