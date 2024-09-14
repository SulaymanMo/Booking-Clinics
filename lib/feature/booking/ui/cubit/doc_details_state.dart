import '../../../../data/models/doctor_model.dart';

abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorLoaded extends DoctorState {
  final List<DoctorModel> doctors;
  DoctorLoaded(this.doctors);
}

class DoctorError extends DoctorState {
  final String error;
  DoctorError(this.error);
}
