import 'package:booking_clinics/feature/home/ui/widget/carousel/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/common/input.dart';
import '../../../../core/common/see_all.dart';
import '../widget/custom_carousel.dart';
import '../widget/categories.dart';
import '../widget/home_appbar.dart';

class HomeNavView extends StatelessWidget {
  const HomeNavView({super.key});
  static const List<String> _images = [
    "assets/images/banner_1.jpg",
    "assets/images/banner_5.png",
    "assets/images/banner_4.png",
    "assets/images/banner_2.png",
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          snap: true,
          floating: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 14.25.h,
          flexibleSpace: const UpperAppBar(),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 0),
            child: Padding(
              padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 1.25.h),
              child: Input(
                hint: "What're you looking for?",
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  child: SvgPicture.asset(
                    "assets/icons/search.svg",
                    colorFilter: const ColorFilter.mode(
                      Colors.black26,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const CustomPageView(images: _images),
              const ListHeader(title: "Categories"),
              const Categories(),
              const ListHeader(title: "Nearby Medical Centers"),
              const CarouselSlider(
                images: [
                  "assets/images/center_1.jpg",
                  "assets/images/center_2.jpg",
                  "assets/images/center_3.jpg",
                ],
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ],
    );
  }
}
