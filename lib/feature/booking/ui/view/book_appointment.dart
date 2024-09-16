import 'package:booking_clinics/core/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../core/common/basic_appbar.dart';
import '../../../../core/common/custom_button.dart';
import '../../../../core/constant/const_color.dart';
import '../../../../data/models/booking.dart';
import '../../../../data/services/remote/firebase_auth.dart';
import '../../../../data/services/remote/firebase_firestore.dart';
import '../cubit/booking_cubit.dart';
import '../cubit/booking_state.dart';
import '../widgets/custom_dialog.dart';

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({
    super.key,
    required this.doctorId,
    required this.doctorName,
    required this.doctorSpeciality,
    required this.doctorAddress,
    required this.doctorImageUrl,
    required this.patientName,
  });

  final String doctorId;
  final String doctorName;
  final String doctorSpeciality;
  final String doctorAddress;
  final String doctorImageUrl;
  final String patientName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookAppointmentCubit(),
      child: Scaffold(
        appBar: const BasicAppBar(title: 'Book Appointment'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
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
                        selectedDecoration: BoxDecoration(
                          color: ConstColor.dark.color,
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
                              ? ConstColor.dark.color
                              : ConstColor.secondary.color,
                          textColor: selectedHour == hour
                              ? Colors.white
                              : Colors.black,
                          onTap: () => cubit.selectHour(hour),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 2.w),

              // Confirm Button
              BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
                builder: (context, state) {
                  final cubit = context.read<BookAppointmentCubit>();
                  return CustomButton(
                    text: "Confirm",
                    textSize: 17.sp,
                    height: 15.w,
                    onTap: cubit.selectedHour != null
                        ? () async {
                            // start loading
                            final newBooking = Booking(
                              docName: doctorName,
                              docAddress: doctorAddress,
                              docSpeciality: doctorSpeciality,
                              docImageUrl: doctorImageUrl,
                              date: cubit.getFormattedDate(),
                              time: cubit.selectedHour!,
                              bookingStatus: 'Pending',
                              patientName: patientName,
                            );
                            String? patientUid = await FirebaseAuthService().getUid();
                            print(patientUid);
                            // Add the booking to Firestore
                            try {
                              FirebaseFirestoreService().addBookingToPatient(patientUid!, newBooking);

                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AppointmentDialog(
                                    doctorName: doctorName,
                                    appointmentDate: cubit.getFormattedDate(),
                                    appointmentTime: '${cubit.selectedHour}',
                                  );
                                },
                              );
                            } catch (e) {
                              print('Error ______ $e');
                            }
                          }
                        : null,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
