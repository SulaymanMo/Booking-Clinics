import 'package:booking_clinics/core/common/custom_button.dart';
import 'package:booking_clinics/core/common/input.dart';
import 'package:booking_clinics/core/common/profile_image.dart';
import 'package:booking_clinics/data/models/patient.dart';
import 'package:booking_clinics/feature/profile/ui/manager/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class EditYourProfile extends StatefulWidget {
  final Patient patient;
  const EditYourProfile({super.key, required this.patient});

  @override
  State<EditYourProfile> createState() => _EditYourProfileState();
}

class _EditYourProfileState extends State<EditYourProfile> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController birthDateController;

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getPatientData();
    nameController = TextEditingController(text: widget.patient.name);
    emailController = TextEditingController(text: widget.patient.email);
    phoneController = TextEditingController(text: widget.patient.phone);
    birthDateController = TextEditingController(text: widget.patient.birthDate);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    birthDateController.dispose();
    super.dispose();
  }

  Future<void> _updatePatientData() async {
    Patient(
      uid: widget.patient.uid,
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      birthDate: birthDateController.text,
      profileImg: widget.patient.profileImg,
      bookings: [],
      favorites: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Fill your Profile"),
      ),
      body: Align(
        alignment: const Alignment(0, -0.75),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
          children: [
            /*change photo*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileImage(
                  onTap: () async {},
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Input(
              hint: "Full Name",
              prefix: Iconsax.user,
              controller: nameController,
            ),
            SizedBox(height: 1.5.h),
            Input(
              prefix: Iconsax.sms,
              hint: "mail@example.com",
              controller: emailController,
            ),
            SizedBox(height: 1.5.h),
            Input(
              hint: "Phone Number",
              prefix: Iconsax.mobile,
              controller: phoneController,
            ),
            SizedBox(height: 1.5.h),
            Input(
              hint: "Date of Birth",
              prefix: Iconsax.calendar,
              controller: birthDateController,
            ),
            SizedBox(height: 4.h),
            CustomButton(
              text: 'Update',
              onTap: _updatePatientData,
              textSize: 14.5.sp,
            ),
          ],
        ),
      ),
    );
  }
}
