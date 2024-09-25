part of 'seeall_cubit.dart';

sealed class SeeAllState {
  const SeeAllState();
}

final class SeeAllInitial extends SeeAllState {}

final class SeeAllLoading extends SeeAllState {}

final class SeeAllSuccess extends SeeAllState {
  final List<DoctorModel> doctors;
  const SeeAllSuccess({required this.doctors});
}

final class SeeAllFailure extends SeeAllState {
  final String error;
  const SeeAllFailure({required this.error});
}

// enum SeeAllState {
//   initial,
//   // ! (1) All
//   allLoading,
//   allSuccess,
//   allFailure,
//   // ! (2) Cardiologist
//   cardiLoading,
//   cardiSuccess,
//   cardiFailure,
//   // ! (3) Dentistry
//   dentistLoading,
//   dentistSuccess,
//   dentistFailure,
//   // ! (4) Dermatology
//   dermatLoading,
//   dermatSuccess,
//   dermatFailure,
//   // ! (5) Pediatrics
//   pediatLoading,
//   pediatSuccess,
//   pediatFailure,
//   // ! (6) Orthopedics
//   orthoLoading,
//   orthoSuccess,
//   orthoFailure,
//   // ! (7) Neurology
//   neuroLoading,
//   neuroSuccess,
//   neuroFailure,
//   // ! (8) Psychiatry
//   psychLoading,
//   psychSuccess,
//   psychFailure;
// }
