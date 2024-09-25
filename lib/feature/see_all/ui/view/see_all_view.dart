import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../widget/see_all_tab.dart';
import '../manager/seeall_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/loading_indicator.dart';
import 'package:booking_clinics/core/constant/extension.dart';

class SeeAllView extends StatefulWidget {
  final int? firstIndex;
  const SeeAllView({this.firstIndex = 0, super.key});

  @override
  State<SeeAllView> createState() => _SeeAllViewState();
}

class _SeeAllViewState extends State<SeeAllView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  static const List<String> _specialty = [
    "All",
    "Cardiologist",
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
    _tabController = TabController(
      vsync: this,
      length: _specialty.length,
      initialIndex: widget.firstIndex ?? 0,
    );
    _onChangeTap();
    // _tabController.addListener(() async => await _onChangeTap());
  }

  Future<void> _onChangeTap() async {
    _tabController.index == 0
        ? await context.read<SeeAllCubit>().invokeAllDoctors()
        : await context
            .read<SeeAllCubit>()
            .invokeBySpecialty(_specialty[_tabController.index]);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController
      ..removeListener(_onChangeTap)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _specialty.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 7.h,
          title: Text("All Specialties", style: context.bold18),
          leading: BackButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.search_normal),
            ),
          ],
          bottom: TabBar(
            onTap: (val) async {
              await _onChangeTap();
            },
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
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            _specialty.length,
            (index) {
              return BlocBuilder<SeeAllCubit, SeeAllState>(
                builder: (_, state) {
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
                    return const LoadingIndicator();
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

class DefaultTabControllerListener extends StatefulWidget {
  const DefaultTabControllerListener({
    super.key,
    required this.child,
    required this.onTabChanged,
  });

  final Widget child;
  final ValueChanged<int> onTabChanged;

  @override
  State<DefaultTabControllerListener> createState() =>
      _DefaultTabControllerListenerState();
}

class _DefaultTabControllerListenerState
    extends State<DefaultTabControllerListener> {
  TabController? _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final TabController? defaultTabController =
        DefaultTabController.maybeOf(context);

    assert(() {
      if (defaultTabController == null) {
        throw FlutterError(
          'No DefaultTabController for ${widget.runtimeType}.\n'
          'When creating a ${widget.runtimeType}, you must ensure that there '
          'is a DefaultTabController above the ${widget.runtimeType}.',
        );
      }
      return true;
    }());

    if (defaultTabController != _controller) {
      _controller?.removeListener(_listener);
      _controller = defaultTabController;
      _controller?.addListener(_listener);
    }
  }

  void _listener() {
    final TabController? controller = _controller;
    if (controller == null || controller.indexIsChanging) return;
    widget.onTabChanged(controller.index);
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.removeListener(_listener);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
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