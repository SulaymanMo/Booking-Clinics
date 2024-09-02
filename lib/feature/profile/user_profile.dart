import 'package:booking_clinics/core/common/basic_appbar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppBar(title: 'Profile', showBackArrow: false),
      body: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}