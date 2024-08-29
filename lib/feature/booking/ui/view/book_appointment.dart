import 'package:flutter/material.dart';

import '../widgets/basic_appbar.dart';

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: 'Book Appointment',
        actionIcon: Icons.settings,
        onActionPressed: () {},
      ),
    );
  }
}
