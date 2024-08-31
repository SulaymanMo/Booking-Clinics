import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../core/common/basic_appbar.dart';
import '../../../../core/common/custom_button.dart';
import '../../../../core/constant/const_color.dart';
import '../cubit/booking_cubit.dart';
import '../cubit/booking_state.dart';

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookAppointmentCubit(),
      child: Scaffold(
        appBar: const BasicAppBar(title: 'Book Appointment'),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Picker
              Text(
                'Select Date',
                style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2.w),
              Card(
                elevation: 3,
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
                        context.read<BookAppointmentCubit>()
                            .selectDate(selectedDay);
                      },
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                      calendarStyle: const CalendarStyle(
                        selectedDecoration: BoxDecoration(
                          color: MyColors.dark,
                          shape: BoxShape.circle,
                        ),
                        todayDecoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 5.w),

              // Hour Picker
              Text(
                'Select Hour',
                style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2.w),
              Expanded(
                child: BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
                  builder: (context, state) {
                    final cubit = context.read<BookAppointmentCubit>();
                    String? selectedHour = state is HourSelectedState
                        ? state.selectedHour
                        : cubit.selectedHour;

                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                              ? MyColors.dark
                              : Colors.grey[200],
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
                    color: cubit.selectedHour != null
                        ? MyColors.dark
                        : MyColors.softGray,
                    textColor: Colors.white,
                    onTap: cubit.selectedHour != null
                        ? () {
                            print("Selected Date: ${cubit.selectedDate}");
                            print("Selected Hour: ${cubit.selectedHour}");
                            // TODO: Show Confirmation Dialog
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
