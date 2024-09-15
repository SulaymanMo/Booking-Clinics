import 'package:booking_clinics/core/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/const_color.dart';
import 'widgets/booking_appbar.dart';
import 'widgets/build_booking_card.dart';

class AppointmentView extends StatefulWidget {
  const AppointmentView({super.key});

  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookingAppBar(tabController: _tabController),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildUpcomingBookings(),
          buildCompletedBookings(),
          buildCanceledBookings(),
        ],
      ),
    );
  }

  Widget buildUpcomingBookings() {
    return ListView.separated(
      padding: EdgeInsets.only(top: 1.h, left: 4.w, right: 4.w, bottom: 2.h),
      itemCount: 4,
      separatorBuilder: (_, __) => SizedBox(height: 1.5.h),
      itemBuilder: (_, __) => buildBookingCard(
        context,
        date: 'May 22, 2023 - 10:00 AM',
        doctorName: 'Dr. James Robinson',
        specialization: 'Orthopedic Surgery',
        clinic: 'Elite Ortho Clinic, USA',
        imageUrl: 'assets/images/banner_2.png',
        buttons: Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Cancel',
                color: MyColors.gray,
                textSize: 14.sp,
                padding: EdgeInsets.all(3.25.w),
                textColor: MyColors.dark2,
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: CustomButton(
                text: 'Reschedule',
                color:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? ConstColor.primary.color
                        : MyColors.dark2,
                textSize: 14.sp,
                padding: EdgeInsets.all(3.25.w),
                textColor:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? ConstColor.dark.color
                        : ConstColor.secondary.color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCompletedBookings() {
    return ListView.separated(
      padding: EdgeInsets.only(top: 1.h, left: 4.w, right: 4.w, bottom: 2.h),
      itemCount: 4,
      separatorBuilder: (_, __) => SizedBox(height: 1.5.h),
      itemBuilder: (_, __) => buildBookingCard(
        context,
        date: 'March 12, 2023 - 11:00 AM',
        doctorName: 'Dr. Sarah Johnson',
        specialization: 'Gynecologist',
        clinic: 'Women\'s Health Clinic, USA',
        imageUrl: 'assets/images/banner_2.png',
        buttons: Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Re-Book',
                color: ConstColor.secondary.color,
                textSize: 14.sp,
                padding: EdgeInsets.all(3.25.w),
                textColor: ConstColor.dark.color,
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: CustomButton(
                text: 'Add Review',
                color:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? ConstColor.primary.color
                        : MyColors.dark2,
                textSize: 14.sp,
                padding: EdgeInsets.all(3.25.w),
                textColor:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? ConstColor.dark.color
                        : ConstColor.secondary.color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCanceledBookings() {
    return ListView.separated(
      padding: EdgeInsets.only(top: 1.h, left: 4.w, right: 4.w, bottom: 2.h),
      itemCount: 4,
      separatorBuilder: (_, __) => SizedBox(height: 1.5.h),
      itemBuilder: (_, __) => buildBookingCard(
        context,
        date: 'March 12, 2023 - 11:00 AM',
        doctorName: 'Dr. Sarah Johnson',
        specialization: 'Gynecologist',
        clinic: 'Women\'s Health Clinic, USA',
        imageUrl: 'assets/images/banner_2.png',
        buttons: Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Re-Book',
                color:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? ConstColor.primary.color
                        : MyColors.dark2,
                textSize: 14.5.sp,
                padding: EdgeInsets.all(3.25.w),
                textColor:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? ConstColor.dark.color
                        : ConstColor.secondary.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
