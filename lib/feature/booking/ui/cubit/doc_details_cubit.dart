import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/remote/firebase_firestore.dart';
import 'doc_details_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final FirebaseFirestoreService _firebaseFirestoreService;

  DoctorCubit(this._firebaseFirestoreService) : super(DoctorInitial());

  Future<void> fetchDoctors() async {
    try {
      emit(DoctorLoading());
      final doctors = await _firebaseFirestoreService.getDoctors();
      emit(DoctorLoaded(doctors));
    } catch (e) {
      emit(DoctorError('Failed to load doctors: $e'));
    }
  }

  Future<void> fetchDoctorById(String doctorId) async {
    try {
      emit(DoctorLoading());
      final doctor = await _firebaseFirestoreService.getDoctorById(doctorId);
      if (doctor != null) {
        emit(DoctorLoaded([doctor]));
      } else {
        emit(DoctorError('Doctor not found'));
      }
    } catch (e) {
      emit(DoctorError('Failed to load doctor: $e'));
    }
  }
}
