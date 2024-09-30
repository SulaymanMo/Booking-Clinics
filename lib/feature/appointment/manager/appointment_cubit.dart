import 'package:booking_clinics/data/models/booking.dart';
import 'package:booking_clinics/data/models/review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  AppointmentCubit(this._authService) : super(AppointmentLoading());

  // ! Post Feedback
  Future<void> postReview({
    required String content,
    required double rating,
    required String doctorId,
  }) async {
    try {
      emit(PostFeedBackLoading());
      final patientDoc = await _patientDoc;
      final doctorRef = await _doctorRef(doctorId);

      if (patientDoc.exists) {
        final Patient patient = Patient.fromJson(
          patientDoc.data() as Map<String, dynamic>,
        );
        doctorRef.update({
          "reviews": FieldValue.arrayUnion([
            ReviewModel(
              rating: rating,
              content: content,
              name: patient.name,
              imageUrl: patient.profileImg,
            ).toJson()
          ])
        });
      }
      debugPrint("Review Posted Successfully");
      emit(PostFeedBackSuccess());
    } catch (e) {
      debugPrint("Failed to Post Review: $e");
    }
  }

  // ! Get bookings when open the page first time
  Future<void> fetchBookings() async {
    try {
      final snapshot = await _patientDoc;
      if (snapshot.exists) {
        Patient patient = Patient.fromJson(
          snapshot.data() as Map<String, dynamic>,
        );
        await _updateStatus(patient);
        _filterBookings(patient.bookings);
        emit(AppointmentSuccess());
        debugPrint("${pending.length}|${completed.length}|${canceled.length}");
      }
    } catch (e) {
      emit(AppointmentFailure("$e"));
      debugPrint('Error fetching bookings: $e');
    }
  }

  // ! Cancel in pending
  Future<void> cancelBooking({required int index}) async {
    try {
      emit(ActionClicked());
      pending[index].bookingStatus = "Canceled";
      // ! Update patient bookings
      final patientRef = await _patientRef;
      await patientRef.update({
        'bookings': List<dynamic>.from(
          _compineBookings.map((booking) => booking.toJson()),
        )
      });
      // ! Update doctor bookings
      final doctorRef = await _doctorRef(pending[index].personId);
      await doctorRef.update({
        'bookings': List<dynamic>.from(
          _compineBookings.map((booking) => booking.toJson()),
        )
      });
      debugPrint("Canceled Succesfully!");
      canceled.insert(0, pending[index]);
      pending.removeAt(index);
      emit(AppointmentSuccess());
    } catch (e) {
      debugPrint("$e");
    }
  }

  // ! Re-Book in canceled
  Future<void> reBook({required String date, required String time}) async {
    try {
      emit(ActionClicked());
      if (index == null) return;
      canceled[index!].date = date;
      canceled[index!].time = time;
      canceled[index!].bookingStatus = "Pending";
      // ! Update patient bookings
      final ref = await _patientRef;
      await ref.update({
        'bookings': List<dynamic>.from(
          _compineBookings.map((booking) => booking.toJson()),
        )
      });
      // ! Update doctor bookings
      final doctorRef = await _doctorRef(canceled[index!].personId);
      await doctorRef.update({
        'bookings': List<dynamic>.from(
          _compineBookings.map((booking) => booking.toJson()),
        )
      });
      pending.insert(0, canceled[index!]);
      canceled.removeAt(index!);
      emit(AppointmentSuccess());
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
      emit(ActionClicked());
      if (index == null) return;
      pending[index!].date = date;
      pending[index!].time = time;
      pending[index!].bookingStatus = "Pending";
      // ! Update patient bookings
      final ref = await _patientRef;
      await ref.update({
        'bookings': List<dynamic>.from(
          _compineBookings.map((booking) => booking.toJson()),
        )
      });
      // ! Update doctor bookings
      final doctorRef = await _doctorRef(pending[index!].personId);
      await doctorRef.update({
        'bookings': List<dynamic>.from(
          _compineBookings.map((booking) => booking.toJson()),
        )
      });
      emit(AppointmentSuccess());
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
      emit(ActionClicked());
      if (index == null) return;
      completed[index!].date = date;
      completed[index!].time = time;
      completed[index!].bookingStatus = "Pending";
      // ! Update patient bookings
      final ref = await _patientRef;
      await ref.update({
        'bookings': List<dynamic>.from(
          _compineBookings.map((booking) => booking.toJson()),
        )
      });
      // ! Update doctor bookings
      final doctorRef = await _doctorRef(completed[index!].personId);
      await doctorRef.update({
        'bookings': List<dynamic>.from(
          _compineBookings.map((booking) => booking.toJson()),
        )
      });
      pending.insert(0, completed[index!]);
      completed.removeAt(index!);
      emit(AppointmentSuccess());
    } catch (e) {
      debugPrint("$e");
    }
  }

  // ! Update status for both user & doctor before filtering
  Future<void> _updateStatus(Patient patient) async {
    bool statusUpdated = false;
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
      // ! Update patient bookings
      final ref = await _patientRef;
      List<Map<String, dynamic>> bookings =
          patient.bookings.map((e) => e.toJson()).toList();
      await ref.update({'bookings': bookings});
      // ! Update doctor bookings
      // final doctorRef = await _doctorRef(patient.bookings[index!].id);
      // await doctorRef.update({
      //   'bookings': List<dynamic>.from(
      //     _compineBookings.map((booking) => booking.toJson()),
      //   )
      // });
      debugPrint('Pending bookings updated to Completed');
    }
  }

  // ! Filter bookings after get it from firebase and update it
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

  // ! (0)
  Future<String?> _getUserid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('uid');
  }

  // ! (1)
  Future<DocumentReference<Map<String, dynamic>>> get _patientRef async =>
      _firestore
          .collection(ConstString.patientsCollection)
          .doc(await _getUserid());

  Future<DocumentReference<Map<String, dynamic>>> _doctorRef(
    String doctorId,
  ) async =>
      _firestore.collection(ConstString.doctorsCollection).doc(doctorId);

  // ! (2)
  Future<DocumentSnapshot<Map<String, dynamic>>> get _patientDoc async =>
      await _firestore
          .collection(ConstString.patientsCollection)
          .doc(await _authService.getUid())
          .get();
}
