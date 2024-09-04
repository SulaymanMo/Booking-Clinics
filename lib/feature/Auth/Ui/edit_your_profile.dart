import 'package:booking_clinics/core/common/basic_appbar.dart';
import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:flutter/material.dart';

class EditYourProfile extends StatelessWidget {
  const EditYourProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: "Fill Your Profile"),
      body: ListView(
        children: [
          Container(
            width: 200,
            height: 200,
            color: MyColors.lightGray,
          )
        ],
      ),

    );
  }
}