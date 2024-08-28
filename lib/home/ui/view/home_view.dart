import 'package:sizer/sizer.dart';
import '../widget/home_appbar.dart';
import '../widget/carousel_item.dart';
import 'package:flutter/material.dart';
import '../../../core/common/input.dart';

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
          ],
        ),
      ),
    );
  }
}

class CarouselSlider extends StatelessWidget {
  const CarouselSlider({super.key});
  static const List<String> images = [
    "assets/images/card_bg.png",
    "assets/images/card_bg1.png",
    "assets/images/card_bg2.png",
    "assets/images/card_bg4.png",
    "assets/images/card_bg3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      child: CarouselView(
        elevation: 4,
        itemSnapping: true,
        shrinkExtent: 95.w,
        itemExtent: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 1.h,
          horizontal: 4.w,
        ),
        children: List.generate(
          images.length,
          (index) => CarouselItem(image: images[index]),
        ),
      ),
    );
  }
}
