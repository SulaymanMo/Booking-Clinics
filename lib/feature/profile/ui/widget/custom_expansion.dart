import 'package:booking_clinics/core/constant/extension.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/const_color.dart';
import 'package:booking_clinics/core/common/input.dart';

class CustomExpansionList extends StatefulWidget {
  const CustomExpansionList({super.key});

  @override
  State<CustomExpansionList> createState() => _CustomExpansionListState();
}

class _CustomExpansionListState extends State<CustomExpansionList> {
  static const List<String> _headers = [
    "Edit Profile",
    "Favorite",
    "Notifications",
    "Settings",
    "Help and Support",
    "Terms and Conditions",
    "Log Out",
  ];

  final List<IconData> _icons = [
    Icons.person_2_outlined,
    Icons.favorite_outline,
    Icons.notifications_outlined,
    Icons.settings_outlined,
    Icons.help_center_outlined,
    Icons.security_outlined,
    Icons.logout_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.zero,
      dividerColor: ConstColor.secondary.color,
      expansionCallback: (int index, bool isExpanded) {},
      children: List.generate(
        _headers.length,
        (index) => ExpansionPanelRadio(
          value: index,
          canTapOnHeader: true,
          backgroundColor: Colors.white,
          headerBuilder: (_, isExpanded) {
            return ListTile(
              leading: Icon(_icons[index]),
              title: Text(
                _headers[index],
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          },
          body: const ListTile(
            contentPadding: EdgeInsets.zero,
            title: EditProfile(),
          ),
        ),
      ),
    );
  }
}

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Flexible(child: Input(hint: "First Name")),
            SizedBox(width: 3.w),
            const Flexible(child: Input(hint: "Last Name")),
          ],
        ),
        SizedBox(height: 3.w),
        const Input(hint: "Phone Number"),
        SizedBox(height: 3.w),
        ElevatedButton(
          onPressed: () {},
          style:
              ElevatedButton.styleFrom(backgroundColor: ConstColor.secondary.color),
          child: Text(
            "Change",
            style: context.regular14?.copyWith(
              fontWeight: FontWeight.bold,
              color: ConstColor.main.color,
            ),
          ),
        ),
      ],
    );
  }
}
