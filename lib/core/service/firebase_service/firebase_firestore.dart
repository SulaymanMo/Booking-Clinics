import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _usersCollection = 'users';

  /// Adds a new user to the users collection.
  Future<void> addUser(Map<String, dynamic> userData) async {
    try {
      await _firestore.collection(_usersCollection).add(userData);
    } catch (e) {
      print('Error adding user: $e');
      rethrow;
    }
  }

  /// Updates specific fields in a user document.
  Future<void> updateUserFields(String userId, Map<String, dynamic> updatedFields) async {
    try {
      await _firestore.collection(_usersCollection).doc(userId).update(updatedFields);
    } catch (e) {
      print('Error updating user fields: $e');
      rethrow;
    }
  }

  /// Replaces the entire user document with a new user object.
  Future<void> updateUser(String userId, Map<String, dynamic> userData) async {
    try {
      await _firestore.collection(_usersCollection).doc(userId).set(userData);
    } catch (e) {
      print('Error updating user: $e');
      rethrow;
    }
  }
}
