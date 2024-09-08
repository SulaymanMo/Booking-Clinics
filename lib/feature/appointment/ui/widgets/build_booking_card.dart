import 'package:flutter/material.dart';
import '../../../../core/constant/const_color.dart';

Widget buildBookingCard({
  required String date,
  required String doctorName,
  required String specialization,
  required String clinic,
  required String imageUrl,
  required Widget buttons,
}) {
  return Material(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    color: Colors.white,
    elevation: 6,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: const TextStyle(
              color: MyColors.dark,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          const Divider(),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imageUrl,
                    height: 115,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Doctor Name
                    Text(
                      doctorName,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 6),
                    // Specialization
                    Text(
                      specialization,
                      style: const TextStyle(
                        color: MyColors.softGray,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Clinic
                    Text(
                      clinic,
                      style: const TextStyle(
                        color: MyColors.softGray,
                        // fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          const Divider(),
          const SizedBox(height: 4),
          buttons,
        ],
      ),
    ),
  );
}
