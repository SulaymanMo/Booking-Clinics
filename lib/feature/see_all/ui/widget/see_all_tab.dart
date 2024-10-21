import 'package:booking_clinics/core/common/custom_image.dart';
import 'package:booking_clinics/core/constant/const_string.dart';
import 'package:booking_clinics/data/models/doctor_model.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import '../../../../data/services/remote/firebase_auth.dart';

class SeeAllTab extends StatelessWidget {
  final List<DoctorModel> doctors;
  const SeeAllTab(this.doctors, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: doctors.length,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      itemBuilder: (_, index) {
        return Card(
          child: InkWell(
            onTap: () async {
              context.nav.pushNamed(
                Routes.doctorDetailsRoute,
                arguments: {
                  'doctorId': doctors[index].id,
                  'patientId': await FirebaseAuthService().getUid(),
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 2.w),
              child: Row(
                children: [
                  CustomImage(
                    image: doctors[index].imageUrl,
                    width: 28.w,
                    height: 28.w,
                    borderRadius: 50.w,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(doctors[index].name, style: context.bold16),
                              SizedBox(width: 1.w),
                              const Icon(Iconsax.heart),
                            ],
                          ),
                          const Divider(),
                          Text(doctors[index].speciality,
                              style: context.semi14),
                          SizedBox(height: 1.h),
                          Row(
                            children: [
                              const Icon(Iconsax.location4),
                              SizedBox(width: 2.w),
                              Flexible(
                                child: Text(
                                  doctors[index].address ?? "Unknown",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.regular14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 0.5.h),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                const Icon(Iconsax.star1,
                                    color: Colors.orangeAccent),
                                SizedBox(width: 2.w),
                                Text(
                                  "${doctors[index].rating}",
                                  style: context.regular14,
                                ),
                                VerticalDivider(width: 8.w),
                                Text(
                                  "${doctors[index].reviews.length} Reviews",
                                  style: context.regular14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (_, index) => SizedBox(height: 1.5.h),
    );
  }
}
