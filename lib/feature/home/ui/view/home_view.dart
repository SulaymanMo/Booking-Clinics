import 'package:booking_clinics/feature/home/ui/widget/carousel/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/common/header.dart';
import '../../../../core/common/input.dart';
import '../../../../core/common/see_all.dart';
import '../../../../core/constant/const_color.dart';
import '../widget/custom_carousel.dart';
import '../widget/categories.dart';
import '../widget/home_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
            preferredSize: Size(double.infinity, 2.5.h),
            child: Padding(
              padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 1.25.h),
              child: const Input(
                hint: "What're you looking for?",
                prefix: Iconsax.search_normal,
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
              // const Header(
              //   title: "Follow HealthPal",
              //   subtitle: "Stay in Touch with Us",
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              //   child: Wrap(
              //     alignment: WrapAlignment.spaceEvenly,
              //     children: List.generate(
              //       4,
              //       (index) => SvgPicture.asset(
              //         "assets/icons/whatsapp.svg",
              //         colorFilter: ColorFilter.mode(
              //           ConstColor.textBtn.color,
              //           BlendMode.srcIn,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ],
    );
  }
}
