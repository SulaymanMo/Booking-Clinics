import 'package:sizer/sizer.dart';
import '../cubit/seeall_cubit.dart';
import '../widget/see_all_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:booking_clinics/core/constant/const_color.dart';

class SeeAllView extends StatefulWidget {
  const SeeAllView({super.key});

  @override
  State<SeeAllView> createState() => _SeeAllViewState();
}

class _SeeAllViewState extends State<SeeAllView> with TickerProviderStateMixin {
  // final double _fixedHeight = 16.h;
  late final TabController _tabController;
  static const List<String> _specialty = [
    "All",
    "General",
    "cardiologist",
    "Dentistry",
    "Dermatology",
    "Pediatrics",
    "Orthopedics",
    "Neurology",
    "Psychiatry",
  ];

  @override
  void initState() {
    super.initState();
    context.read<SeeAllCubit>().invokeAllDoctors();
    _tabController = TabController(length: _specialty.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        context.read<SeeAllCubit>().invokeAllDoctors();
      } else {
        context
            .read<SeeAllCubit>()
            .invokeBySpecialty(_specialty[_tabController.index]);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController
      ..removeListener(() {})
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _specialty.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 7.h,
          title: Text("All Doctors", style: context.bold18),
          bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 1.h),
            tabs: List.generate(
              _specialty.length,
              (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Tab(text: _specialty[index], height: 5.h),
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: List.generate(
            _specialty.length,
            (index) {
              return BlocBuilder<SeeAllCubit, SeeAllState>(
                builder: (context, state) {
                  if (state is SeeAllSuccess) {
                    if (state.doctors.isEmpty) {
                      return Center(
                        child: Text(
                          "No doctors found",
                          style: context.semi16,
                        ),
                      );
                    } else {
                      return SeeAllTab(state.doctors);
                    }
                  } else if (state is SeeAllFailure) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ConstColor.primary.color,
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

//  body: TabBarView(
//           controller: _tabController,
//           children: List.generate(
//             _specialty.length,
//             (index) => const SeeAllTab(),
//           ),
//         ),

//  PreferredSize(
//             preferredSize: Size.fromHeight(_fixedHeight / 1.75),
//             child: Column(
//               children: [
//                 // Padding(
//                 //   padding: EdgeInsets.only(
//                 //     top: _fixedHeight - (_fixedHeight / 3),
//                 //     left: 4.w,
//                 //     right: 4.w,
//                 //   ),
//                 //   child: const Input(
//                 //     hint: "Search",
//                 //     prefix: Iconsax.search_normal,
//                 //   ),
//                 // ),
//                 TabBar(
//                   isScrollable: true,
//                   controller: _tabController,
//                   tabAlignment: TabAlignment.start,
//                   padding: EdgeInsets.only(
//                     top: _fixedHeight / 2,
//                     left: 4.w,
//                     right: 4.w,
//                     bottom: 1.h,
//                   ),
//                   tabs: List.generate(
//                     _specialist.length,
//                     (index) => Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 4.w),
//                       child: Tab(text: _specialist[index], height: 5.h),
//                     ),
//                   ),
//                 ),
// Padding(
//   padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
//   child: Row(
//     children: [
//       Text(
//         "532 founds",
//         style: context.bold14,
//       ),
//       const Spacer(),
//       Text(
//         "Default",
//         style: context.semi14?.copyWith(
//           color: Colors.black38,
//         ),
//       ),
//       SizedBox(width: 2.w),
//       const Icon(Icons.filter_list, color: Colors.black38),
//     ],
//   ),
// ),
//   ],
// ),
// )
