import 'package:flutter/material.dart';

import '../widgets/basic_appbar.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: 'Doctor Details',
        actionIcon: Icons.favorite_border,
        onActionPressed: () {},
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
