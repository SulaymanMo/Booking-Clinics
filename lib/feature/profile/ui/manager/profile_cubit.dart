import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:booking_clinics/data/models/patient.dart';
import 'package:booking_clinics/data/services/remote/firebase_auth.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final FirebaseAuthService _service;
  ProfileCubit(this._service) : super(ProfileInitial());
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ! get uid from local
  Future<String?> get _getUid async => await _service.getUid();

  // ! get user data from firebase by uid
  Future<void> getPatientData() async {
    emit(ProfileLoading());
    try {
      final String? uid = await _getUid;
      final DocumentSnapshot doc =
          await _firestore.collection('patients').doc(uid).get();
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        emit(ProfileSuccess(Patient.fromJson(data)));
      } else {
        emit(const ProfileFailure('User not found'));
      }
    } catch (e) {
      emit(const ProfileFailure("Oops... Something went wrong!"));
    }
  }

  // ! Update user data
  Future<void> updateUserData(Patient data) async {
    try {
      final String? uid = await _getUid;
      await _firestore.collection('patients').doc(uid).update(data.toJson());
    } catch (e) {
      emit(const ProfileFailure("Oops... Something went wrong!"));
    }
  }
}
