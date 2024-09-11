import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/patient.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _patientsCollection = 'patients';

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

  /// Updates specific fields in a user document.
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

  /// Replaces the entire user document with a new user object.
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
}
