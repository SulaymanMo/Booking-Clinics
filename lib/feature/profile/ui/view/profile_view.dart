import 'package:booking_clinics/core/common/loading_indicator.dart';
import 'package:booking_clinics/core/constant/const_string.dart';
import 'package:booking_clinics/feature/profile/ui/image_manager/pick_image_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper/logout_btn_sheet.dart';
import '../../../auth/ui/views/edit_your_profile.dart';
import '../profile_manager/profile_cubit.dart';
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
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (_, state) {
            if (state is UpdateProfileLoading) {}
          },
          builder: (_, state) {
            if (state is ProfileSuccess) {
              return Column(
                children: [
                  SizedBox(height: 2.h),
                  Text("Profile", style: context.semi20),
                  SizedBox(height: 4.h),
                  ProfileImage(
                    image: state.model.profileImg.isEmpty
                        ? null
                        : NetworkImage(state.model.profileImg),
                    onTap: () async {
                      await navToEditPage(context);
                    },
                  ),
                  SizedBox(height: 2.h),
                  Text(state.model.name, style: context.bold16),
                  SizedBox(height: 0.5.h),
                  Text(
                    state.model.phone,
                    style: context.regular14?.copyWith(
                      color: ConstColor.icon.color,
                    ),
                  ),
                  SizedBox(height: 4.h),

                  // Favorite
                  ListTile(
                    onTap: () => context.nav.pushNamed(Routes.favoriteView),
                    title: Text(
                      "Favorite",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),
                    leading: const Icon(
                      Iconsax.heart,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0.5.h,
                      horizontal: 6.w,
                    ),
                  ),
                  // List of settings
                  const CustomExpansionList(),
                  // Log Out
                  ListTile(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return const LogoutBottomSheet();
                        },
                      );
                    },
                    title: Text(
                      "Log Out",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    leading: const Icon(Icons.logout_outlined),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0.5.h,
                      horizontal: 6.w,
                    ),
                  ),
                ],
              );
            } else if (state is ProfileFailure) {
              return Center(
                child: Text(state.error, style: context.semi16),
              );
            } else if (state is ProfileLoading) {
              return const LoadingIndicator();
            } else {
              return const Center();
            }
          },
        ),
      ),
    );
  }

  Future<dynamic> navToEditPage(BuildContext context) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<ProfileCubit>.value(
                value: context.read<ProfileCubit>(),
              ),
              BlocProvider<PickImageCubit>(
                create: (_) => PickImageCubit(),
              ),
            ],
            child: const EditYourProfile(),
          );
        },
      ),
    );
  }
}
