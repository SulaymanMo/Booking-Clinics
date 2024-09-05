import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:booking_clinics/core/common/input.dart';
import 'package:booking_clinics/core/constant/extension.dart';

class SeeAllView extends StatefulWidget {
  const SeeAllView({super.key});

  @override
  State<SeeAllView> createState() => _SeeAllViewState();
}

class _SeeAllViewState extends State<SeeAllView> with TickerProviderStateMixin {
  final double _fixedHeight = 14.h;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("All Doctors", style: context.bold18),
          toolbarHeight: _fixedHeight,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: EdgeInsets.only(
                top: _fixedHeight - 3.5.h,
                left: 4.w,
                right: 4.w,
              ),
              child: const Input(hint: "Search", prefix: Iconsax.search_normal),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(_fixedHeight / 2 - 2.h),
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              padding: EdgeInsets.only(top: _fixedHeight / 2),
              tabs: List.generate(
                8,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Tab(text: "Index $index", height: 5.h),
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: List.generate(
            8,
            (index) => Center(
              child: Text("Index $index"),
            ),
          ),
        ),
      ),
    );
  }
}
