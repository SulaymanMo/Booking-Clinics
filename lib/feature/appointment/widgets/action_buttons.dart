import 'package:booking_clinics/feature/appointment/manager/appointment_cubit.dart';
import 'package:booking_clinics/feature/booking/ui/view/book_appointment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../core/common/custom_button.dart';
import '../../../core/constant/const_color.dart';
import '../../../data/models/booking.dart';

class ActionButtons extends StatelessWidget {
  final String status;
  final int bookingId;
  final List<Booking> bookings;
  const ActionButtons({
    super.key,
    required this.status,
    required this.bookings,
    required this.bookingId,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    if (status == 'Pending') {
      return Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'Cancel',
              color: MyColors.gray,
              textSize: 14.5.sp,
              padding: const EdgeInsets.all(12),
              textColor: MyColors.dark2,
              onTap: () async => await context
                  .read<AppointmentCubit>()
                  .cancelBooking(index: bookingId),
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: CustomButton(
              text: 'Reschedule',
              color: isDark ? MyColors.primary : MyColors.dark,
              textSize: 14.5.sp,
              padding: const EdgeInsets.all(12),
              textColor: isDark ? MyColors.dark : Colors.white,
              onTap: () async => reBook(context, isReschedule: true),
            ),
          ),
        ],
      );
    } else if (status == 'Completed') {
      return Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'Re-Book',
              color: MyColors.gray,
              textSize: 14.5.sp,
              padding: const EdgeInsets.all(12),
              textColor: MyColors.dark2,
              onTap: () => reBook(context, isRebookCompleted: true),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: CustomButton(
              text: 'Add Review',
              color: isDark ? MyColors.primary : MyColors.dark,
              textSize: 14.5.sp,
              padding: const EdgeInsets.all(12),
              textColor: isDark ? MyColors.dark : Colors.white,
            ),
          ),
        ],
      );
    } else if (status == 'Canceled') {
      return Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'Re-Book',
              color: isDark ? MyColors.primary : MyColors.dark,
              textSize: 14.5.sp,
              padding: const EdgeInsets.all(15),
              textColor: isDark ? MyColors.dark : Colors.white,
              onTap: () => reBook(context, isRebook: true),
            ),
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  void reBook(
    BuildContext context, {
    bool isRebook = false,
    bool isReschedule = false,
    bool isRebookCompleted = false,
  }) {
    context.read<AppointmentCubit>().index = bookingId;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider<AppointmentCubit>.value(
            value: context.read<AppointmentCubit>(),
            child: BookAppointmentView(
              isReBooking: isRebook,
              isReschedule: isReschedule,
              isRebookCompleted: isRebookCompleted,
              doctorId: bookings[bookingId].doctorId,
              doctorName: bookings[bookingId].docName,
              doctorSpeciality: bookings[bookingId].docSpeciality,
              doctorAddress: bookings[bookingId].docAddress,
              doctorImageUrl: bookings[bookingId].docImageUrl,
              patientName: bookings[bookingId].patientName,
            ),
          );
        },
      ),
    );
  }
}
