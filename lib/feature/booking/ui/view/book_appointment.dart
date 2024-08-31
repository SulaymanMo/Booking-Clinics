import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../core/common/basic_appbar.dart';
import '../../../../core/common/custom_button.dart';
import '../../../../core/constant/const_color.dart';

class BookAppointmentView extends StatefulWidget {
  const BookAppointmentView({super.key});

  @override
  State <BookAppointmentView> createState() => _BookAppointmentViewState();
}

class _BookAppointmentViewState extends State<BookAppointmentView> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedHour;

  final List<String> hours = [
    "09.00 AM",
    "09.30 AM",
    "10.00 AM",
    "10.30 AM",
    "11.00 AM",
    "11.30 AM",
    "3.00 PM",
    "3.30 PM",
    "4.00 PM",
    "4.30 PM",
    "5.00 PM",
    "5.30 PM"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: TableCalendar(
                focusedDay: _selectedDate,
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                calendarFormat: CalendarFormat.month,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDate, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDate = selectedDay;
                  });
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
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: hours.length,
                itemBuilder: (context, index) {
                  return CustomButton(
                    text: hours[index],
                    textSize: 14.sp,
                    color: _selectedHour == hours[index]
                        ? MyColors.dark
                        : Colors.grey[200],
                    textColor: _selectedHour == hours[index]
                        ? Colors.white
                        : Colors.black,
                    onTap: () {
                      setState(() {
                        _selectedHour = hours[index];
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 2.w),

            // Confirm Button
            CustomButton(
              text: "Confirm",
              color: _selectedHour != null ? MyColors.dark : MyColors.softGray,
              textColor: Colors.white,
              onTap: _selectedHour != null
                  ? () {
                      print("Selected Date: $_selectedDate");
                      print("Selected Hour: $_selectedHour");
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
