import 'package:booking_clinics/data/models/doctor_model.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:booking_clinics/core/constant/extension.dart';

class SeeAllTab extends StatelessWidget {
  final List<DoctorModel> doctors;
  const SeeAllTab(this.doctors, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: doctors.length,
      padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 2.h),
      itemBuilder: (_, index) {
        return Card(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 2.w,
              horizontal: 2.w,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(3.w),
                  child: Image.asset(
                    "assets/images/banner_3.png",
                    width: 35.w,
                    height: 35.w,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              doctors[index].name,
                              style: context.bold16,
                            ),
                            SizedBox(width: 1.w),
                            const Icon(Iconsax.heart),
                          ],
                        ),
                        const Divider(),
                        Text(
                          doctors[index].speciality,
                          style: context.semi14,
                        ),
                        SizedBox(height: 1.h),
                        Row(
                          children: [
                            const Icon(Iconsax.location4),
                            SizedBox(width: 1.w),
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
                              const Icon(
                                Iconsax.star1,
                                color: Colors.orangeAccent,
                              ),
                              SizedBox(width: 1.w),
                              Text(
                                "${doctors[index].rating}",
                                style: context.regular14,
                              ),
                              const VerticalDivider(),
                              Text(
                                "127 Reviews",
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
        );
      },
      separatorBuilder: (_, index) => SizedBox(height: 1.5.h),
    );
  }
}
