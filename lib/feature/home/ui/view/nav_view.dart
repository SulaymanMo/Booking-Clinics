import 'package:booking_clinics/core/helper/service_locator.dart';
import 'package:booking_clinics/feature/booking/ui/view/doctor_details.dart';
import 'package:booking_clinics/feature/map/data/repo/location_repo/location_repo_imp.dart';
import 'package:booking_clinics/feature/map/data/repo/map_repo/map_impl.dart';
import 'package:booking_clinics/feature/map/data/repo/routes_repo/routes_impl.dart';
import 'package:booking_clinics/feature/map/ui/manager/map_cubit.dart';
import 'package:booking_clinics/feature/map/ui/view/map_view.dart';
import 'package:booking_clinics/feature/profile/ui/view/same_design.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:booking_clinics/feature/home/ui/view/home_nav_view.dart';

class NavView extends StatefulWidget {
  const NavView({super.key});

  @override
  State<NavView> createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  int _index = 0;
  static final List<Widget> _pages = [
    const HomeNavView(),
    BlocProvider(
      create: (context) => MapCubit(
        mapRepo: getIt.get<MapImpl>(),
        routesRepo: getIt.get<RoutesImpl>(),
        locationRepo: getIt.get<LocationImpl>(),
      )..predectPlaces(),
      child: const MapView(),
    ),
    const DoctorDetailsView(),
    const SameDesign(),
  ];
  
  static const List<String> _icons = [
    "assets/icons/home.svg",
    "assets/icons/location.svg",
    "assets/icons/calendar.svg",
    "assets/icons/profile.svg",
  ];
  static const List<String> _iconsFill = [
    "assets/icons/home_fill.svg",
    "assets/icons/location_fill.svg",
    "assets/icons/calendar_fill.svg",
    "assets/icons/profile_fill.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(bottom: false, child: _pages[_index]),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add, size: 24.sp),
      // ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(4.w),
        child: BottomAppBar(
          // notchMargin: 2.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int index = 0; index < _pages.length; index++) ...[
                IconButton(
                  onPressed: () {
                    setState(() {
                      _index = index;
                    });
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: _index == index ? Colors.black12 : null,
                  ),
                  icon: SvgPicture.asset(
                    _index == index ? _iconsFill[index] : _icons[index],
                    colorFilter: ColorFilter.mode(
                      ConstColor.main.color,
                      BlendMode.srcIn,
                    ),
                  ),
                  // icon: Icon(
                  //   _index == index
                  //       ? _selectedIocn[index]
                  //       : _unSelectedIocn[index],
                  //   color: _index == index
                  //       ? ConstColor.main.color
                  //       : Colors.black38,
                  // ),
                ),
                // if (index < _pages.length - 1) const Spacer(),
                // ! _____ When notched floating action button are provided _____ ! //
                // if (index < _pages.length - 1)
                //   Spacer(
                //     flex: index == (_pages.length ~/ 2) - 1 ? 2 : 1,
                //   ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
