import 'package:booking_clinics/core/constant/extension.dart';
import 'package:sizer/sizer.dart';
import '../widget/home_appbar.dart';
import 'package:flutter/material.dart';
import '../widget/carousel_slider.dart';
import '../../../../core/common/input.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBarTitle(),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 7.25.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: const Input(
              prefix: Icons.search,
              hint: "Search doctor...",
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          children: const [
            CarouselSlider(),
            Categories(),
          ],
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({super.key});
  static const List<String> _images = [
    "assets/images/category_2.svg",
    "assets/images/category_3.svg",
    "assets/images/category_1.svg",
    "assets/images/category_4.svg",
    "assets/images/category_6.svg",
    "assets/images/category_8.svg",
    "assets/images/category_7.svg",
    "assets/images/category_5.svg",
  ];

  static const List<String> _categories = [
    "Dentistry",
    "Cardiolo..",
    "Pulmono..",
    "General",
    "Neurology",
    "Gastroen..",
    "Laborato..",
    "Vaccinat..",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
      child: Column(
        children: [
          const ListHeader(title: "Categories"),
          SizedBox(
            height: 28.h,
            child: GridView.builder(
              padding: EdgeInsets.only(top: 1.5.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 4.w,
                // crossAxisSpacing: 2.w,
                // childAspectRatio: 1 / 2,
                // mainAxisExtent: 28.w,
              ),
              itemCount: _images.length,
              itemBuilder: (_, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(_images[index]),
                    Flexible(
                      child: Text(
                        _categories[index],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListHeader extends StatelessWidget {
  const ListHeader({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.textTheme.headlineSmall),
        const Text("See All"),
      ],
    );
  }
}
