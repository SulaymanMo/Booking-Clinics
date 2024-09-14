import 'package:booking_clinics/core/constant/images_path.dart';
import 'package:booking_clinics/core/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/common/custom_network_img.dart';
import '../../../../core/constant/const_color.dart';

class RoundedDoctorCard extends StatelessWidget {
  const RoundedDoctorCard({super.key, required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2.0,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 17.5.h,
        child: Row(
          children: [
            // Doctor image
            CustomNetworkImage(
              imageUrl: doctor.imageUrl,
              height: double.infinity,
              width: 44.sp,
              borderRadius: 10,
              fallbackAsset: MyImages.doctorAvatar,
            ),
            SizedBox(width: 3.w),

            // Doctor Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    doctor.name.isNotEmpty ? doctor.name : 'No Name',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 1),
                  // Speciality
                  Flexible(
                    child: Text(
                      doctor.speciality.isNotEmpty
                          ? doctor.speciality
                          : 'Specialty Not Provided',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: MyColors.softGray,
                        fontWeight: FontWeight.bold,
                      ),
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
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: MyColors.softGray,
                          ),
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
