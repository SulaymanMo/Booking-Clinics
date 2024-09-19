import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/rate.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:booking_clinics/data/models/doctor_model.dart';
import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListItem extends StatelessWidget {
  final DoctorModel doctor;
  const ListItem({required this.doctor, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CachedNetworkImage(
          imageUrl: doctor.imageUrl ?? "",
          height: 20.h,
          fit: BoxFit.cover,
          width: double.infinity,
          placeholder: (_, url) => SizedBox(
            height: 20.h,
            width: double.infinity,
          ),
          errorWidget: (_, url, error) => Icon(
            Iconsax.close_square,
            size: 24.sp,
          ),
          errorListener: (val) => debugPrint('$val'),
        ),
        const Spacer(),
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
          title: Row(
            children: [
              Text(
                "${doctor.name},",
                style: context.semi16,
              ),
              SizedBox(width: 2.w),
              Text(
                "(${doctor.speciality})",
                style: context.medium14?.copyWith(
                  color: ConstColor.textBtn.color,
                ),
              ),
            ],
          ),
          subtitle: Text(
            doctor.address ?? "",
            style: context.medium14?.copyWith(
              color: ConstColor.textBtn.color,
            ),
          ),
          trailing: const Rate(),
        ),
        const Spacer(),
      ],
    );
  }
}
