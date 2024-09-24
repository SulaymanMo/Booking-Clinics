import 'package:booking_clinics/core/common/custom_button.dart';
import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:booking_clinics/data/models/booking.dart';
import 'package:booking_clinics/data/services/remote/firebase_auth.dart';
import 'package:booking_clinics/feature/booking/ui/view/book_appointment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _patientsCollection = 'patients';

  // Fetch bookings by status
  Future<List<Map<String, dynamic>>> fetchBookings(String status) async {
    try {
      String? patientId = await FirebaseAuthService().getUid();

      final patientRef =
          _firestore.collection(_patientsCollection).doc(patientId);
      final docSnapshot = await patientRef.get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data();
        if (data != null && data['bookings'] != null) {
          final bookingsJson =
              List<Map<String, dynamic>>.from(data['bookings']);
          return bookingsJson
              .where((booking) => booking['bookingStatus'] == status)
              .toList();
        }
      }
      return [];
    } catch (e) {
      print('Error fetching bookings: $e');
      throw Exception('Failed to fetch bookings');
    }
  }

  Future<void> updateBookingStatus(String bookingId, String newStatus) async {
    try {
      String? patientId = await FirebaseAuthService().getUid();

      final patientRef =
          _firestore.collection(_patientsCollection).doc(patientId);
      final docSnapshot = await patientRef.get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data();
        if (data != null && data['bookings'] != null) {
          final bookings = List<Map<String, dynamic>>.from(data['bookings']);
          final bookingIndex =
              bookings.indexWhere((booking) => booking['id'] == bookingId);

          if (bookingIndex != -1) {
            bookings[bookingIndex]['bookingStatus'] = newStatus;

            await patientRef.update({
              'bookings': bookings,
            });
          }
        }
      }
    } catch (e) {
      print('Error updating booking status: $e');
      throw Exception('Failed to update booking status');
    }
  }
}

class AppointmentView extends StatefulWidget {
  @override
  _AppointmentViewState createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  final BookingService _bookingService = BookingService();
  

  @override
  Widget _buildActionButtons(String status, String bookingId, Booking booking) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    if (status == 'Pending') {
      return Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'Cancel',
              color: MyColors.gray,
              textSize: 13,
              padding: const EdgeInsets.all(12),
              textColor: MyColors.dark2,
              onTap: () async {
                await _bookingService.updateBookingStatus(
                    bookingId, 'Canceled');
                setState(() {});
              },
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: CustomButton(
              text: 'Reschedule',
              color: isDark ? MyColors.primary : MyColors.dark,
              textSize: 13,
              padding: const EdgeInsets.all(12),
              textColor: isDark ? MyColors.dark : Colors.white,
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookAppointmentView(
                      doctorId: booking.doctorId, // Use correct field
                      doctorName: booking.docName,
                      doctorSpeciality: booking.docSpeciality,
                      doctorAddress: booking.docAddress,
                      doctorImageUrl: booking.docImageUrl,
                      patientName: booking.patientName,
                    ),
                  ),
                );
                //
              },
            ),
          ),
        ],
      );
    } else if (status == 'Completed') {
      return Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'Re-Book',
              color: MyColors.gray,
              textSize: 13,
              padding: const EdgeInsets.all(12),
              textColor: MyColors.dark2,
              onTap: () async {
                await _bookingService.updateBookingStatus(bookingId, 'Pending');
                setState(() {});
              },
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: CustomButton(
              text: 'Add Review',
              color: isDark ? MyColors.primary : MyColors.dark,
              textSize: 13,
              padding: const EdgeInsets.all(12),
              textColor: isDark ? MyColors.dark : Colors.white,
              onTap: () {
                // Implement add review logic
              },
            ),
          ),
        ],
      );
    } else if (status == 'Canceled') {
      return Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'Re-Book',
              color: isDark ? MyColors.primary : MyColors.dark,
              textSize: 13,
              padding: const EdgeInsets.all(15),
              textColor: isDark ? MyColors.dark : Colors.white,
              onTap: () async {
                await _bookingService.updateBookingStatus(bookingId, 'Pending');
                setState(() {});
              },
            ),
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
