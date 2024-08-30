import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:booking_clinics/feature/home/ui/view/home_nav_view.dart';
import 'package:booking_clinics/feature/booking/ui/view/book_appointment.dart';

class NavView extends StatefulWidget {
  const NavView({super.key});

  @override
  State<NavView> createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  int _index = 0;
  static const List<Widget> _pages = [
    HomeNavView(),
    BookAppointmentView(),
    BookAppointmentView(),
    BookAppointmentView(),
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
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: SafeArea(bottom: false, child: _pages[_index]),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add, size: 24.sp),
      // ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 1.25.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3.25.w),
          child: BottomAppBar(
            // notchMargin: 2.w,
            child: Row(
              children: [
                for (int index = 0; index < _pages.length; index++) ...[
                  IconButton(
                    onPressed: () {
                      _index = index;
                      setState(() {});
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
                  if (index < _pages.length - 1) const Spacer(),
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
      ),
    );
  }
}
