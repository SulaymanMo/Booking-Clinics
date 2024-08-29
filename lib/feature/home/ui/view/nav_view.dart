import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:booking_clinics/feature/home/ui/view/home_nav_view.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class NavView extends StatefulWidget {
  const NavView({super.key});

  @override
  State<NavView> createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  int _index = 0;
  static const List<IconData> _unSelectedIocn = [
    Icons.home_outlined,
    Icons.pin_drop_outlined,
    Icons.calendar_month_outlined,
    Icons.person_2_outlined,
  ];
  static const List<IconData> _selectedIocn = [
    Icons.home,
    Icons.pin_drop,
    Icons.calendar_month,
    Icons.person_2,
  ];
  static const List<Widget> _pages = <Widget>[
    HomeNavView(),
    HomeNavView(),
    HomeNavView(),
    HomeNavView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: SafeArea(bottom: false, child: _pages[_index]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 24.sp),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(12.w),
        child: BottomAppBar(
          child: Row(
            children: [
              for (int index = 0; index < _pages.length; index++) ...[
                IconButton(
                  onPressed: () {
                    _index = index;
                    setState(() {});
                  },
                  icon: Icon(
                    _index == index
                        ? _selectedIocn[index]
                        : _unSelectedIocn[index],
                    color: _index == index
                        ? ConstColor.main.color
                        : Colors.black38,
                  ),
                ),
                if (index < _pages.length - 1)
                  Spacer(
                    flex: index == (_pages.length ~/ 2) - 1 ? 3 : 1,
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
