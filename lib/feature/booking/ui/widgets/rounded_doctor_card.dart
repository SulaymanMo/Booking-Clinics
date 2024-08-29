import 'package:flutter/material.dart';

import '../../../../core/constant/const_color.dart';

class RoundedDoctorCard extends StatelessWidget {
  const RoundedDoctorCard({
    super.key,
    this.doctorName = 'Dr. David Patel',
    this.doctorSpeciality = 'Dentist',
    this.doctorLocation = 'New York, USA',
    this.doctorImage = 'assets/images/card_bg.png',
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
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 140,
        child: Row(
          children: [
            SizedBox(
              height: double.infinity,
              width: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Image.asset(
                    doctorImage,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16.0),

            // Column with multiple texts
            Expanded(
              child: SizedBox(
                height: 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 1),
                    Text(
                      doctorSpeciality,
                      style: const TextStyle(
                        fontSize: 15,
                        color: MyColors.softGray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: MyColors.softGray,
                          size: 15,
                        ),
                        Text(
                          doctorLocation,
                          style: const TextStyle(
                            fontSize: 15,
                            color: MyColors.softGray,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
