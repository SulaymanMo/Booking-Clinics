import 'package:booking_clinics/core/common/custom_button.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:booking_clinics/feature/booking/ui/cubit/doc_details_cubit.dart';
import 'package:booking_clinics/feature/booking/ui/cubit/doc_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/common/basic_appbar.dart';
import '../../../../core/common/section_heading.dart';
import '../../../../core/constant/const_color.dart';
import '../../../../core/constant/const_string.dart';
import '../../../../data/remote/firebase_firestore.dart';
import '../widgets/achievement_column.dart';
import '../widgets/reviews_item.dart';
import '../widgets/rounded_doctor_card.dart';

class DoctorDetailsView extends StatelessWidget {
  final String doctorId;

  const DoctorDetailsView({super.key, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DoctorCubit(FirebaseFirestoreService())..fetchDoctorById(doctorId),
      child: Scaffold(
        appBar: BasicAppBar(
          title: 'Doctor Details',
          actionIcon: Iconsax.heart,
          onActionPressed: () {},
        ),
        body: BlocBuilder<DoctorCubit, DoctorState>(
          builder: (context, state) {
            if (state is DoctorLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DoctorError) {
              return Center(child: Text(state.error));
            } else if (state is DoctorLoaded && state.doctors.isNotEmpty) {
              final doctor = state.doctors.first;

              return Container(
                width: context.mediaQuery.size.width,
                height: context.mediaQuery.size.height,
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                color: Colors.white,
                child: ListView(
                  children: [
                    // Doctor Card
                    RoundedDoctorCard(doctor: doctor),
                    SizedBox(height: 2.h),
                    // Achievements Row
                    AchievementRow(
                      patients: doctor.patientsNumber ?? 0,
                      experience: doctor.experience ?? 0,
                      rating: doctor.rating ?? 0.0,
                      reviews: doctor.reviews.length,
                    ),
                    SizedBox(height: 2.h),
                    // About me
                    const SectionHeading(
                        title: 'About me', showActionButton: false),
                    SizedBox(height: 1.h),
                    Text(
                      doctor.about ?? "No information provided.",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 15.sp, color: MyColors.softGray),
                    ),
                    SizedBox(height: 2.h),

                    // Working Time
                    const SectionHeading(
                        title: 'Working Time', showActionButton: false),
                    SizedBox(height: 1.h),
                    Text(
                      doctor.workingHours ?? "Not available",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 15.sp, color: MyColors.softGray),
                    ),
                    SizedBox(height: 2.h),

                    // Reviews
                    const SectionHeading(title: 'Reviews', showActionButton: false),
                    SizedBox(height: 0.5.h),
                    // const ReviewsItem(),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: doctor.reviews.length,
                      itemBuilder: (context, index) => ReviewsItem(
                        image: doctor.reviews[index].imageUrl,
                        name: doctor.reviews[index].name,
                        rating: doctor.reviews[index].rating.toString(),
                        review: doctor.reviews[index].content,
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Center(child: Text('No data found'));
            }
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: CustomButton(
            text: 'Book Appointment',
            height: 15.w,
            color: MyColors.dark,
            textColor: Colors.white,
            textSize: 16.sp,
            padding: EdgeInsets.zero,
            onTap: () => context.nav.pushNamed(Routes.bookAppointmentRoute),
          ),
        ),
      ),
    );
  }
}
