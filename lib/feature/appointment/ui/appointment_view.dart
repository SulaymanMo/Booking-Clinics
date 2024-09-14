import 'package:booking_clinics/core/common/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/const_color.dart';
import 'widgets/booking_appbar.dart';
import 'widgets/build_booking_card.dart';

class AppointmentView extends StatefulWidget {
  const AppointmentView({super.key});

  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookingAppBar(tabController: _tabController),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildUpcomingBookings(),
          buildCompletedBookings(),
          buildCanceledBookings(),
        ],
      ),
    );
  }

  Widget buildUpcomingBookings() {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 90),
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(height: 4),
      itemBuilder: (_, __) => buildBookingCard(
        date: 'May 22, 2023 - 10:00 AM',
        doctorName: 'Dr. James Robinson',
        specialization: 'Orthopedic Surgery',
        clinic: 'Elite Ortho Clinic, USA',
        imageUrl: 'assets/images/banner_2.png',
        buttons: const Row(
          children: [
             Expanded(
              child: CustomButton(
                text: 'Cancel',
                color: MyColors.gray,
                textSize: 13,
                padding: EdgeInsets.all(12),
                textColor: MyColors.dark2,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: CustomButton(
                text: 'Reschedule',
                color: MyColors.dark,
                textSize: 13,
                padding: EdgeInsets.all(12),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCompletedBookings() {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 90),
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(height: 4),
      itemBuilder: (_, __) => buildBookingCard(
        date: 'March 12, 2023 - 11:00 AM',
        doctorName: 'Dr. Sarah Johnson',
        specialization: 'Gynecologist',
        clinic: 'Women\'s Health Clinic, USA',
        imageUrl: 'assets/images/banner_2.png',
        buttons: const Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Re-Book',
                color: MyColors.gray,
                textSize: 13,
                padding: EdgeInsets.all(12),
                textColor: MyColors.dark2,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: CustomButton(
                text: 'Add Review',
                color: MyColors.dark,
                textSize: 13,
                padding: EdgeInsets.all(12),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCanceledBookings() {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 90),
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(height: 4),
      itemBuilder: (_, __) => buildBookingCard(
        date: 'March 12, 2023 - 11:00 AM',
        doctorName: 'Dr. Sarah Johnson',
        specialization: 'Gynecologist',
        clinic: 'Women\'s Health Clinic, USA',
        imageUrl: 'assets/images/banner_2.png',
        buttons: const Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Re-Book',
                color: MyColors.dark,
                textSize: 13,
                padding: EdgeInsets.all(15),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
