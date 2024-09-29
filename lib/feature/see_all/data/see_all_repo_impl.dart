import 'package:booking_clinics/core/constant/const_string.dart';

import 'see_all_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:booking_clinics/core/helper/failure.dart';
import 'package:booking_clinics/data/models/doctor_model.dart';

class SeeAllRepoImpl implements SeeAllRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, List<DoctorModel>>> getAllDoctors() async {
    try {
      final QuerySnapshot query =
          await _firestore.collection(ConstString.doctorsCollection).get();

      final List<DoctorModel> doctors = query.docs.map((doc) {
        return DoctorModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      return right(doctors);
    } catch (e) {
      return left(UnknownFailure("$e"));
    }
  }

  @override
  Future<Either<Failure, List<DoctorModel>>> getDoctorsBySpecialty(
    String specialty,
  ) async {
    try {
      final QuerySnapshot query = await _firestore
          .collection(ConstString.doctorsCollection)
          .where('speciality', isEqualTo: specialty)
          .get();

      final List<DoctorModel> doctors = query.docs.map(
        (doc) {
          return DoctorModel.fromJson(doc.data() as Map<String, dynamic>);
        },
      ).toList();
      return right(doctors);
    } catch (e) {
      return left(UnknownFailure("$e"));
    }
  }
}
