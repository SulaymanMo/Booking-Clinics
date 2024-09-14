import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/doctor_model.dart';
import '../../models/patient.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _patientsCollection = 'patients';
  final String _doctorsCollection = 'doctors';

  /// Adds a new patient to the patients collection.
  Future<void> addPatient(Patient patient) async {
    try {
      await _firestore
          .collection(_patientsCollection)
          .doc(patient.uid)
          .set(patient.toJson());
    } catch (e) {
      print('Error adding patient: $e');
      rethrow;
    }
  }

  /// Updates specific fields in a patient document.
  Future<void> updatePatientFields(
      String uid, Map<String, dynamic> updatedFields) async {
    try {
      await _firestore
          .collection(_patientsCollection)
          .doc(uid)
          .update(updatedFields);
    } catch (e) {
      print('Error updating user fields: $e');
      rethrow;
    }
  }

  // Updates a patient document.
  Future<void> updateUser(Patient patient) async {
    try {
      await _firestore
          .collection(_patientsCollection)
          .doc(patient.uid)
          .set(patient.toJson());
    } catch (e) {
      print('Error updating user: $e');
      rethrow;
    }
  }

  /// Fetches all doctors from the doctors collection.
  Future<List<DoctorModel>> getDoctors() async {
    try {
      final querySnapshot = await _firestore.collection(_doctorsCollection).get();
      return querySnapshot.docs
          .map((doc) => DoctorModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching doctors: $e');
      rethrow;
    }
  }

  /// Fetches a doctor by ID from the doctors collection.
  Future<DoctorModel?> getDoctorById(String doctorId) async {
    try {
      final docSnapshot = await _firestore.collection(_doctorsCollection).doc(doctorId).get();
      if (docSnapshot.exists) {
        return DoctorModel.fromJson(docSnapshot.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('Error fetching doctor by ID: $e');
      rethrow;
    }
  }
}
