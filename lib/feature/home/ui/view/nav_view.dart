import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:booking_clinics/core/helper/service_locator.dart';
import 'package:booking_clinics/feature/map/data/repo/location_repo/location_repo_imp.dart';
import 'package:booking_clinics/feature/map/data/repo/map_repo/map_impl.dart';
import 'package:booking_clinics/feature/map/data/repo/routes_repo/routes_impl.dart';
import 'package:booking_clinics/feature/map/ui/manager/map_cubit.dart';
import 'package:booking_clinics/feature/map/ui/view/map_view.dart';
import 'package:booking_clinics/feature/profile/ui/view/profile_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:booking_clinics/feature/home/ui/view/home_view.dart';
import '../../../appointment/ui/appointment_view.dart';

class NavView extends StatefulWidget {
  const NavView({super.key});

  @override
  State<NavView> createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  int _index = 0;
  static final List<Widget> _pages = [
    const HomeView(),
    BlocProvider(
      create: (context) => MapCubit(
        mapRepo: getIt.get<MapImpl>(),
        routesRepo: getIt.get<RoutesImpl>(),
        locationRepo: getIt.get<LocationImpl>(),
      )..predectPlaces(),
      child: const MapView(),
    ),
    const AppointmentView(),
    const ProfileView(),
  ];

  static const List<IconData> _icons = [
    Iconsax.home,
    Iconsax.location4,
    Iconsax.calendar_1,
    Iconsax.user4,
  ];
  static const List<IconData> _iconsFill = [
    Iconsax.home1,
    Iconsax.location5,
    Iconsax.calendar5,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: _index == 1,
      resizeToAvoidBottomInset: false,
      body: _pages[_index],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(4.w),
        child: BottomAppBar(
          height: 7.5.h,
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
                    backgroundColor: _index == index &&
                            MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                        ? ConstColor.primary.color
                        : _index == index
                            ? ConstColor.secondary.color
                            : Colors.transparent,
                  ),
                  icon: Icon(
                    index == _index ? _iconsFill[index] : _icons[index],
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? _index == index
                            ? ConstColor.dark.color
                            : ConstColor.secondary.color
                        : ConstColor.dark.color,
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
