part of 'appointment_cubit.dart';

sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}

final class AppointmentLoading extends AppointmentState {}

final class AppointmentSuccess extends AppointmentState {}

final class AppointmentFailure extends AppointmentState {
  final String error;
  AppointmentFailure(this.error);
}

final class ActionClicked extends AppointmentState {}
