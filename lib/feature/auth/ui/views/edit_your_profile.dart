import 'package:booking_clinics/core/common/basic_appbar.dart';
import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:booking_clinics/data/models/patient.dart';
import 'package:booking_clinics/feature/auth/ui/widgets/custom_elevated_button.dart';
import 'package:booking_clinics/feature/auth/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    final updatedPatient = Patient(
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
      appBar: const BasicAppBar(title: "Edit Your Profile"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              SizedBox(height: 5.h),
              /*change photo*/
              Center(
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    CircleAvatar(
                      radius: 20.w,
                      backgroundColor: ConstColor.icon.color,
                      backgroundImage: NetworkImage(widget.patient.profileImg),
                      child: widget.patient.profileImg.isEmpty
                          ? Icon(Iconsax.user, size: 20.w, color: Colors.white)
                          : null,
                    ),
                    Positioned(
                      right: 0,
                      bottom: 6.w,
                      child: Container(
                        padding: EdgeInsets.all(1.2.w),
                        decoration: BoxDecoration(
                          color: ConstColor.main.color,
                          borderRadius: BorderRadius.circular(3.w),
                        ),
                        child: const Icon(Icons.edit, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              CustomTextFormField(
                controller: nameController,
                hint: "Your Name",
              ),
              SizedBox(height: 1.5.h),
              CustomTextFormField(
                controller: emailController,
                hint: "name@example.com",
              ),
              SizedBox(height: 1.5.h),
              CustomTextFormField(
                controller: phoneController,
                hint: "Phone Number",
              ),
              SizedBox(height: 1.5.h),
              CustomTextFormField(
                controller: birthDateController,
                hint: "Date of Birth",
                suffixIcon: SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset("assets/icons/calendar_fill.svg"),
                ),
              ),
              SizedBox(height: 3.h),
              CustomElevatedButton(
                title: "Save",
                onPressed: _updatePatientData, // Call the update function
              ),
            ],
          ),
        ),
      ),
    );
  }
}
