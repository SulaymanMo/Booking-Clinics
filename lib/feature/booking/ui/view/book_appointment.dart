import 'package:flutter/material.dart';

import '../widgets/basic_appbar.dart';

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'Book Appointment'),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
