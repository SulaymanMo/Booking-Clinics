import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constant/const_color.dart';
import '../../../../core/constant/images_path.dart';

class RoundedDoctorCard extends StatelessWidget {
  const RoundedDoctorCard({
    super.key,
    this.doctorName = 'Dr. David Patel',
    this.doctorSpeciality = 'Dentist',
    this.doctorLocation = 'New York, USA',
    this.doctorImage = MyImages.doctorImg,
  });

  final String doctorName;
  final String doctorSpeciality;
  final String doctorLocation;
  final String doctorImage;

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
            SizedBox(
              height: double.infinity,
              width: 44.sp,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    doctorImage,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 4.w),

            // Doctor Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 1),
                  Text(
                    doctorSpeciality,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.5.sp,
                      color: MyColors.softGray,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                       Icon(
                        Icons.location_on,
                        color: MyColors.softGray,
                        size: 2.4.h,
                      ),
                      Text(
                        ' $doctorLocation',
                        style: TextStyle(
                          fontSize: 16.4.sp,
                          color: MyColors.softGray,
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
