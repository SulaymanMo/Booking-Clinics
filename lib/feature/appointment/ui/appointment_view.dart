import 'package:booking_clinics/core/common/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/const_color.dart';
import 'widgets/booking_appbar.dart';
import 'widgets/build_booking_card.dart';
class BookingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<Map<String, dynamic>>> fetchBookings(String status) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('bookings')
        .where('bookingStatus', isEqualTo: status)
        .get();

    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
}
class AppointmentView extends StatefulWidget {
  const AppointmentView({super.key});

  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final BookingService _bookingService = BookingService();

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
          buildBookingsTab(context, 'Upcoming'), 
          buildBookingsTab(context, 'Completed'),
          buildBookingsTab(context, 'Canceled'), 
        ],
      ),
    );
  }

  Widget buildBookingsTab(BuildContext context, String status) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _bookingService.fetchBookings(status),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Error loading bookings'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No bookings available'));
        }

        final bookings = snapshot.data!;

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 90),
          itemCount: bookings.length,
          separatorBuilder: (_, __) => const SizedBox(height: 6),
          itemBuilder: (context, index) {
            final booking = bookings[index];
            return buildBookingCard(
              context,
              date: booking['date'],
              doctorName: booking['docName'],
              specialization: booking['docSpeciality'],
              clinic: booking['docAddress'],
              imageUrl: booking['docImageUrl'],
              buttons: _buildActionButtons(status),
            );
          },
        );
      },
    );
  }

  // Build action buttons dynamically based on status
  Widget _buildActionButtons(String status) {
    if (status == 'Upcoming') {
      return const Row(
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
      );
    } else if (status == 'Completed') {
      return const Row(
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
      );
    } else if (status == 'Canceled') {
      return const Row(
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
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

// class AppointmentView extends StatefulWidget {
//   const AppointmentView({super.key});

//   @override
//   State<AppointmentView> createState() => _AppointmentViewState();
// }

// class _AppointmentViewState extends State<AppointmentView>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BookingAppBar(tabController: _tabController),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           buildUpcomingBookings(context),
//           buildCompletedBookings(context),
//           buildCanceledBookings(context),
//         ],
//       ),
//     );
//   }

//   Widget buildUpcomingBookings(BuildContext context) {
//     return ListView.separated(
//       padding: const EdgeInsets.fromLTRB(12, 8, 12, 90),
//       itemCount: 4,
//       separatorBuilder: (_, __) => const SizedBox(height: 6),
//       itemBuilder: (context, index) => buildBookingCard(
//         context,
//         date: 'May 22, 2023 - 10:00 AM',
//         doctorName: 'Dr. James Robinson',
//         specialization: 'Orthopedic Surgery',
//         clinic: 'Elite Ortho Clinic, USA',
//         imageUrl: 'assets/images/banner_2.png',
//         buttons: const Row(
//           children: [
//             Expanded(
//               child: CustomButton(
//                 text: 'Cancel',
//                 color: MyColors.gray,
//                 textSize: 13,
//                 padding: EdgeInsets.all(12),
//                 textColor: MyColors.dark2,
//               ),
//             ),
//             SizedBox(width: 20),
//             Expanded(
//               child: CustomButton(
//                 text: 'Reschedule',
//                 color: MyColors.dark,
//                 textSize: 13,
//                 padding: EdgeInsets.all(12),
//                 textColor: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildCompletedBookings(BuildContext context) {
//     return ListView.separated(
//       padding: const EdgeInsets.fromLTRB(12, 8, 12, 90),
//       itemCount: 4,
//       separatorBuilder: (_, __) => const SizedBox(height: 6),
//       itemBuilder: (context, index) => buildBookingCard(
//         context,
//         date: 'March 12, 2023 - 11:00 AM',
//         doctorName: 'Dr. Sarah Johnson',
//         specialization: 'Gynecologist',
//         clinic: 'Women\'s Health Clinic, USA',
//         imageUrl: 'assets/images/banner_2.png',
//         buttons: const Row(
//           children: [
//             Expanded(
//               child: CustomButton(
//                 text: 'Re-Book',
//                 color: MyColors.gray,
//                 textSize: 13,
//                 padding: EdgeInsets.all(12),
//                 textColor: MyColors.dark2,
//               ),
//             ),
//             SizedBox(width: 20),
//             Expanded(
//               child: CustomButton(
//                 text: 'Add Review',
//                 color: MyColors.dark,
//                 textSize: 13,
//                 padding: EdgeInsets.all(12),
//                 textColor: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildCanceledBookings(BuildContext context) {
//     return ListView.separated(
//       padding: const EdgeInsets.fromLTRB(12, 8, 12, 90),
//       itemCount: 4,
//       separatorBuilder: (_, __) => const SizedBox(height: 6),
//       itemBuilder: (context, index) => buildBookingCard(
//         context,
//         date: 'March 12, 2023 - 11:00 AM',
//         doctorName: 'Dr. Sarah Johnson',
//         specialization: 'Gynecologist',
//         clinic: 'Women\'s Health Clinic, USA',
//         imageUrl: 'assets/images/banner_2.png',
//         buttons: const Row(
//           children: [
//             Expanded(
//               child: CustomButton(
//                 text: 'Re-Book',
//                 color: MyColors.dark,
//                 textSize: 13,
//                 padding: EdgeInsets.all(15),
//                 textColor: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
