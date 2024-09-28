import 'package:booking_clinics/data/models/booking.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constant/const_string.dart';
import '../../../data/models/patient.dart';
import '../../../data/services/remote/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  int? index;
  List<Booking> pending = [];
  List<Booking> canceled = [];
  List<Booking> completed = [];
  final FirebaseAuthService _authService;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  AppointmentCubit(this._authService) : super(AppointmentInitial());

  Future<void> fetchBookings() async {
    emit(AppointmentLoading());
    try {
      final ref = await _getRef;
      final snapshot = await _getDoc;
      if (snapshot.exists) {
        Patient patient = Patient.fromJson(
          snapshot.data() as Map<String, dynamic>,
        );

        // ! Update status before filtering
        bool statusUpdated = false; // Track if any status has been updated
        DateTime currentDate = DateTime.now();

        for (int i = 0; i < patient.bookings.length; i++) {
          if (patient.bookings[i].bookingStatus == 'Pending') {
            DateTime bookingDate = DateTime.parse(patient.bookings[i].date);
            if (bookingDate.isBefore(currentDate)) {
              patient.bookings[i].bookingStatus = 'Completed';
              statusUpdated = true;
            }
          }
        }
        if (statusUpdated) {
          List<Map<String, dynamic>> bookings =
              patient.bookings.map((e) => e.toJson()).toList();
          await ref.update({'bookings': bookings});
          debugPrint('Pending bookings updated to Completed');
        }
        _filterBookings(patient.bookings);
        emit(AppointmentSuccess());
        debugPrint("${pending.length}|${completed.length}|${canceled.length}");
      }
    } catch (e) {
      emit(AppointmentFailure("$e"));
      debugPrint('Error fetching bookings : $e');
    }
  }

  // ! Cancel in pending
  Future<void> cancelBooking({required int index}) async {
    try {
      final ref = await _getRef;
      pending[index].bookingStatus = "Canceled";
      await ref.update({
        'bookings': List<dynamic>.from(
          _compineBookings.map((booking) => booking.toJson()),
        )
      });
      debugPrint("Canceled Succesfully!");
    } catch (e) {
      debugPrint("$e");
    }
  }

  // ! Re-Book in canceled
  Future<void> reBook({required String date, required String time}) async {
    try {
      if (index == null) return;
      canceled[index!].date = date;
      canceled[index!].time = time;
      canceled[index!].bookingStatus = "Pending";

      final ref = await _getRef;
      await ref.update({
        'bookings': List<dynamic>.from(
          _compineBookings.map((booking) => booking.toJson()),
        )
      });
      debugPrint("Great... Booking Updated date & time!");
    } catch (e) {
      debugPrint("$e");
    }
  }

  // ! Reschedule in pending
  Future<void> reschadule({
    required String date,
    required String time,
  }) async {
    try {
      if (index == null) return;
      pending[index!].date = date;
      pending[index!].time = time;
      pending[index!].bookingStatus = "Pending";

      final ref = await _getRef;
      await ref.update({
        'bookings': List<dynamic>.from(
          _compineBookings.map((booking) => booking.toJson()),
        )
      });
      debugPrint("Great... Booking Updated date & time!");
    } catch (e) {
      debugPrint("$e");
    }
  }

  // ! Re-Book in completed
  Future<void> rebookCompleted({
    required String date,
    required String time,
  }) async {
    try {
      if (index == null) return;
      completed[index!].date = date;
      completed[index!].time = time;
      completed[index!].bookingStatus = "Pending";

      final ref = await _getRef;
      await ref.update({
        'bookings': List<dynamic>.from(
          _compineBookings.map((booking) => booking.toJson()),
        )
      });
      debugPrint("Great... Booking Updated date & time!");
    } catch (e) {
      debugPrint("$e");
    }
  }

  // ! Filter bookings after get it from firebase
  void _filterBookings(List<Booking> bookings) {
    for (int i = 0; i < bookings.length; i++) {
      if (bookings[i].bookingStatus == "Pending") {
        pending.add(bookings[i]);
      } else if (bookings[i].bookingStatus == "Completed") {
        completed.add(bookings[i]);
      } else if (bookings[i].bookingStatus == "Canceled") {
        canceled.add(bookings[i]);
      } else {
        debugPrint(bookings[i].bookingStatus);
      }
    }
  }

  // ! Compine bookings before update it in firebase
  List<Booking> get _compineBookings =>
      [pending, canceled, completed].expand((i) => i).toList();

  // ! (1)
  Future<String?> _getUserid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('uid');
  }

  // ! (2)
  Future<DocumentReference<Map<String, dynamic>>> get _getRef async =>
      _firestore
          .collection(ConstString.patientsCollection)
          .doc(await _getUserid());

  // ! (3)
  Future<DocumentSnapshot<Map<String, dynamic>>> get _getDoc async =>
      await _firestore
          .collection(ConstString.patientsCollection)
          .doc(await _authService.getUid())
          .get();
}
