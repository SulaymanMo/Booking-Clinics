import 'package:booking_clinics/data/models/doctor_model.dart';
import 'package:booking_clinics/feature/appointment/manager/appointment_cubit.dart';
import 'package:booking_clinics/feature/booking/ui/view/book_appointment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../core/common/custom_button.dart';
import '../../../core/constant/const_color.dart';
import '../../../core/helper/show_msg.dart';
import '../../../data/models/booking.dart';
import 'review_bottom_sheet.dart';

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
              onTap: () {
                final read = context.read<AppointmentCubit>();
                showMsg(
                  context,
                  title: "Cancel",
                  msg:
                      "Are you sure? This appointment for Dr. ${bookings[bookingId].name} will be canceled!",
                  alertWidget: Icon(
                    Iconsax.danger,
                    size: 35.sp,
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Colors.black
                        : ConstColor.primary.color,
                  ),
                  onPressed: () async {
                    await read.cancelBooking(index: read.index!);
                  },
                );
                context.read<AppointmentCubit>().index = bookingId;
              },
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
              onTap: () => postReview(context),
            ),
          ),
        ],
      );
    } else if (status == 'Canceled') {
      return CustomButton(
        text: 'Re-Book',
        color: isDark ? MyColors.primary : MyColors.dark,
        textSize: 14.5.sp,
        padding: const EdgeInsets.all(15),
        textColor: isDark ? MyColors.dark : Colors.white,
        onTap: () => reBook(context, isRebook: true),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Future<Widget?> postReview(BuildContext context) {
    return showModalBottomSheet<Widget>(
      context: context,
      isScrollControlled: true,
      builder: (_) => BlocProvider<AppointmentCubit>.value(
        value: context.read<AppointmentCubit>(),
        child: ReviewSheet(booking: bookings[bookingId]),
      ),
    );
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
              model: DoctorModel(
                id: bookings[bookingId].id,
                name: bookings[bookingId].name,
                speciality: bookings[bookingId].specialty,
                email: "",
                location: {},
                bookings: [],
                reviews: [],
              ),
              // doctorId: bookings[bookingId].id,
              // doctorName: bookings[bookingId].name,
              // doctorSpeciality: bookings[bookingId].specialty,
              // doctorAddress: bookings[bookingId].address,
              // doctorImageUrl: bookings[bookingId].imageUrl,
              // patientName: bookings[bookingId].personId,
            ),
          );
        },
      ),
    );
  }
}
