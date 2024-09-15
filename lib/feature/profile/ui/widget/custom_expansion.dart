import 'package:sizer/sizer.dart';
import 'custom_expansion_text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/const_color.dart';
import 'package:booking_clinics/feature/profile/ui/widget/settings_item.dart';

class CustomExpansionList extends StatefulWidget {
  const CustomExpansionList({super.key});

  @override
  State<CustomExpansionList> createState() => _CustomExpansionListState();
}

class _CustomExpansionListState extends State<CustomExpansionList> {
  static const List<String> _headers = [
    "Favorite",
    "Notifications",
    "Settings",
    "Help and Support",
    "Terms and Conditions",
  ];

  final List<IconData> _icons = [
    Iconsax.heart,
    Iconsax.notification,
    Iconsax.setting,
    Iconsax.message_question,
    Iconsax.security4,
  ];

  static const List<Widget> _widgets = [
    CustomExpansionText(),
    CustomExpansionText(),
    SettingsItem(),
    CustomExpansionText(),
    CustomExpansionText(),
  ];

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      elevation: 0,
      expandIconColor: ConstColor.icon.color,
      expandedHeaderPadding: EdgeInsets.zero,
      dividerColor:
          MediaQuery.of(context).platformBrightness == Brightness.light
              ? ConstColor.secondary.color
              : ConstColor.dark.color,
      expansionCallback: (int index, bool isExpanded) {},
      children: List.generate(
        _headers.length,
        (index) => ExpansionPanelRadio(
          value: index,
          canTapOnHeader: true,
          backgroundColor:
              MediaQuery.of(context).platformBrightness == Brightness.light
                  ? Colors.white
                  : ConstColor.dark.color,
          headerBuilder: (_, isExpanded) {
            return ListTile(
              leading: Icon(_icons[index]),
              contentPadding: EdgeInsets.symmetric(horizontal: 2.w),
              title: Text(
                _headers[index],
                style: TextStyle(
                  fontSize: 15.sp,
                  // color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          },
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            child: _widgets[index],
          ),
        ),
      ),
    );
  }
}
