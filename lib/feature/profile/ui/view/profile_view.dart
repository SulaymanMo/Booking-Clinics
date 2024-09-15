import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper/logout_btn_sheet.dart';
import '../../../auth/ui/views/edit_your_profile.dart';
import '../manager/profile_cubit.dart';
import '../widget/custom_expansion.dart';
import '../../../../core/common/profile_image.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:booking_clinics/core/constant/const_color.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.25),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (_, state) {
            if (state is ProfileSuccess) {
              return Column(
                children: [
                  SizedBox(height: 2.h),
                  Text("Profile", style: context.semi20),
                  SizedBox(height: 4.h),
                  ProfileImage(
                    onTap: () async {
                      await navToEditPage(context, state);
                    },
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    state.model.name,
                    style: context.bold16,
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    state.model.phone,
                    style: context.regular14?.copyWith(
                      color: ConstColor.icon.color,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  const CustomExpansionList(),
                  ListTile(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return const LogoutBottomSheet();
                        },
                      );
                      // showLogoutBtnSheet(context);
                    },
                    title: Text(
                      "Log Out",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    leading: const Icon(Icons.logout_outlined),
                    contentPadding: EdgeInsets.symmetric(horizontal: 2.w),
                  ),
                ],
              );
            } else if (state is ProfileFailure) {
              return Center(
                child: Text(
                  state.error,
                  style: context.semi16,
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: ConstColor.primary.color,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Future<dynamic> navToEditPage(
    BuildContext context,
    ProfileSuccess state,
  ) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider<ProfileCubit>.value(
            value: context.read<ProfileCubit>(),
            child: EditYourProfile(
              patient: state.model,
            ),
          );
        },
      ),
    );
  }
}
