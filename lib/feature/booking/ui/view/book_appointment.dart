import 'package:booking_clinics/core/constant/extension.dart';
import 'package:booking_clinics/core/helper/show_msg.dart';
import 'package:booking_clinics/data/models/doctor_model.dart';
import 'package:booking_clinics/feature/appointment/manager/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/common/basic_appbar.dart';
import '../../../../core/common/custom_button.dart';
import '../../../../core/constant/const_color.dart';
import '../../../../core/helper/service_locator.dart';
import '../../../../data/models/booking.dart';
import '../../../../data/models/patient.dart';
import '../../../../data/services/remote/firebase_auth.dart';
import '../../../../data/services/remote/firebase_firestore.dart';
import '../../cubit/booking_cubit.dart';
import '../../cubit/booking_state.dart';
import '../widgets/custom_dialog.dart';

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({
    super.key,
    this.isReBooking = false,
    this.isReschedule = false,
    this.isRebookCompleted = false,
    required this.model,
    // required this.doctorId,
    // required this.doctorName,
    // required this.doctorSpeciality,
    // required this.doctorAddress,
    // required this.doctorImageUrl,
    // required this.patientName,
  });

  final bool? isReschedule;
  final bool? isReBooking;
  final bool? isRebookCompleted;
  final DoctorModel model;
  // final String doctorId;
  // final String doctorName;
  // final String doctorSpeciality;
  // final String doctorAddress;
  // final String doctorImageUrl;
  // final String patientName;

  @override
  Widget build(BuildContext context) {
    final isDark = context.theme.brightness == Brightness.dark;
    return BlocProvider(
      create: (context) => BookAppointmentCubit(),
      child: Scaffold(
        appBar: const BasicAppBar(title: 'Book Appointment'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Picker
              Text(
                'Select Date',
                style: context.bold18,
              ),
              SizedBox(height: 1.5.h),
              Card(
                child: BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
                  builder: (context, state) {
                    DateTime selectedDate = state is DateSelectedState
                        ? state.selectedDate
                        : context.read<BookAppointmentCubit>().selectedDate;

                    return TableCalendar(
                      focusedDay: selectedDate,
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      calendarFormat: CalendarFormat.month,
                      selectedDayPredicate: (day) {
                        return isSameDay(selectedDate, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        context
                            .read<BookAppointmentCubit>()
                            .selectDate(selectedDay);
                      },
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                      calendarStyle: CalendarStyle(
                        selectedTextStyle: TextStyle(
                          color: isDark ? ConstColor.dark.color : Colors.white,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: isDark
                              ? ConstColor.primary.color
                              : ConstColor.dark.color,
                          shape: BoxShape.circle,
                        ),
                        todayDecoration: BoxDecoration(
                          color: ConstColor.icon.color,
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 2.h),

              // Hour Picker
              Text(
                'Select Hour',
                style: context.bold18,
              ),
              SizedBox(height: 1.5.h),
              Expanded(
                child: BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
                  builder: (context, state) {
                    final cubit = context.read<BookAppointmentCubit>();
                    String? selectedHour = state is HourSelectedState
                        ? state.selectedHour
                        : cubit.selectedHour;

                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2.5,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: cubit.hours.length,
                      itemBuilder: (context, index) {
                        String hour = cubit.hours[index];
                        return CustomButton(
                          text: hour,
                          textSize: 14.sp,
                          color: selectedHour == hour
                              ? isDark
                                  ? ConstColor.primary.color
                                  : ConstColor.dark.color
                              : isDark
                                  ? ConstColor.iconDark.color
                                  : ConstColor.secondary.color,
                          textColor: selectedHour == hour
                              ? isDark
                                  ? ConstColor.dark.color
                                  : Colors.white
                              : isDark
                                  ? ConstColor.secondary.color
                                  : ConstColor.dark.color,
                          onTap: () => cubit.selectHour(hour),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 2.w),
              // Confirm Button
              BlocConsumer<BookAppointmentCubit, BookAppointmentState>(
                listener: (context, state) {
                  if (state is BookAppointmentFailure) {
                    showMsg(
                      context,
                      title: "Hint",
                      msg: state.error,
                      alertWidget: Icon(Iconsax.danger, size: 35.sp),
                      onPressed: () async {},
                    );
                  }
                },
                builder: (context, state) {
                  final cubit = context.read<BookAppointmentCubit>();
                  return CustomButton(
                    text: "Confirm",
                    textSize: 17.sp,
                    height: 15.w,
                    onTap: () async {
                      if (cubit.selectedHour == null) return;
                      if (isReBooking!) {
                        await context.read<AppointmentCubit>().reBook(
                              date: cubit.getFormattedDate(),
                              time: cubit.selectedHour!,
                            );
                        if (context.mounted) bookingDialog(context, cubit);
                      } else if (isReschedule!) {
                        await context.read<AppointmentCubit>().reschadule(
                              date: cubit.getFormattedDate(),
                              time: cubit.selectedHour!,
                            );
                        if (context.mounted) bookingDialog(context, cubit);
                      } else if (isRebookCompleted!) {
                        await context.read<AppointmentCubit>().rebookCompleted(
                              date: cubit.getFormattedDate(),
                              time: cubit.selectedHour!,
                            );
                        if (context.mounted) bookingDialog(context, cubit);
                      } else {
                        try {
                          final date = cubit.getFormattedDate();
                          String? patientId =
                              await getIt.get<FirebaseAuthService>().getUid();
                          const Uuid uuid = Uuid();
                          final String bookingId = uuid.v4();
                          // ! Add to patient
                          final Booking patientBooking = Booking(
                            id: patientId!,
                            name: model.name,
                            address: model.address ?? "",
                            specialty: model.speciality,
                            imageUrl: model.imageUrl ?? "",
                            date: date,
                            time: cubit.selectedHour!,
                            bookingStatus: 'Pending',
                            personId: model.id,
                            isAccepted: 0,
                            bookingId: bookingId,
                          );
                          await getIt
                              .get<FirebaseFirestoreService>()
                              .addBookingToPatient(patientId, patientBooking);
                          // ! Add to doctor
                          final Patient? patient = await getIt
                              .get<FirebaseFirestoreService>()
                              .getPatientById(patientId);
                          final Booking doctorBooking = Booking(
                            id: model.id,
                            name: patient!.name,
                            address: "Unknown",
                            specialty: model.speciality,
                            imageUrl: patient.profileImg,
                            date: date,
                            time: cubit.selectedHour!,
                            bookingStatus: 'Pending',
                            personId: patientId,
                            isAccepted: 0,
                            bookingId: bookingId,
                          );
                          await getIt
                              .get<FirebaseFirestoreService>()
                              .addBookingToDoctor(
                                model.id,
                                doctorBooking,
                              );
                          if (context.mounted) bookingDialog(context, cubit);
                        } catch (e) {
                          debugPrint('Error ______ $e');
                        }
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void bookingDialog(BuildContext context, BookAppointmentCubit cubit) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AppointmentDialog(
          doctorName: model.name,
          appointmentDate: cubit.getFormattedDate(),
          appointmentTime: '${cubit.selectedHour}',
        );
      },
    );
  }
}
