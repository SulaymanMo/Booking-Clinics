import 'package:booking_clinics/core/common/deopdown.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            "Language",
            style: context.medium14,
          ),
          trailing: const DropDown(titles: ["EN", "AR"]),
        ),
        ListTile(
          title: Text(
            "Theme Mode",
            style: context.medium14,
          ),
          subtitle: const Text("Experience HealthPal in light or dark theme."),
          trailing: Switch(
            value: false,
            onChanged: (val) {},
          ),
        ),
      ],
    );
  }
}
