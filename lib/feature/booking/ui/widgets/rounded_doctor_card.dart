import 'package:booking_clinics/core/common/custom_image.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constant/const_color.dart';
import '../../../../data/models/doctor_model.dart';

class RoundedDoctorCard extends StatelessWidget {
  const RoundedDoctorCard({super.key, required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(2.w),
        height: 17.5.h,
        child: Row(
          children: [
            // Doctor image
            CustomImage(image: doctor.imageUrl, width: 32.w, height: 32.w),
            SizedBox(width: 4.w),

            // Doctor Details
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    doctor.name.isNotEmpty ? doctor.name : 'No Name Provided',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.bold16,
                  ),
                  const Divider(),
                  SizedBox(height: 0.5.h),
                  // Speciality
                  Flexible(
                    child: Text(
                      doctor.speciality.isNotEmpty
                          ? doctor.speciality
                          : 'Specialty Not Provided',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.semi14,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  // Address
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: MyColors.softGray,
                        size: 2.h,
                      ),
                      Flexible(
                        child: Text(
                          doctor.address != null
                              ? doctor.address!
                              : 'No Address',
                          style: context.regular14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
