import 'package:booking_clinics/core/common/basic_appbar.dart';
import 'package:flutter/material.dart';

class UserBookingsScreen extends StatelessWidget {
  const UserBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppBar(title: 'MyBookings', showBackArrow: false),
      body: Center(
        child: Text('My Bookings'),
      ),
    );
  }
}
