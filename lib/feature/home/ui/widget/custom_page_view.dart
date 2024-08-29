import 'carousel_indicator.dart';
import 'carousel_item.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatefulWidget {
  final List<String> images;
  const CustomPageView({required this.images, super.key});

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: widget.images.length,
            onPageChanged: (val) {
              setState(() {
                _index = val;
              });
            },
            itemBuilder: (_, index) => CarouselItem(
              image: widget.images[index],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 1.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<CarouselIndicator>.generate(
                widget.images.length,
                (index) => CarouselIndicator(_index == index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
