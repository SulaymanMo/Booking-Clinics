import 'package:booking_clinics/core/common/custom_image.dart';
import 'package:booking_clinics/core/common/loading_indicator.dart';
import 'package:booking_clinics/core/constant/extension.dart';
import 'package:booking_clinics/feature/appointment/manager/appointment_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../core/common/custom_button.dart';
import '../../../core/common/input.dart';
import '../../../core/constant/const_color.dart';
import '../../../data/models/booking.dart';

class ReviewSheet extends StatefulWidget {
  final Booking booking;
  const ReviewSheet({super.key, required this.booking});

  @override
  State<ReviewSheet> createState() => _ReviewSheetState();
}

class _ReviewSheetState extends State<ReviewSheet>
    with SingleTickerProviderStateMixin {
  int selected = 0;
  late Animation<double> _shakeAnimation;
  late Animation<Color?> _colorAnimation;
  late TextEditingController _textController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _shakeAnimation = Tween<double>(begin: 0, end: 10)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_animationController);

    _colorAnimation = ColorTween(
      begin: Colors.amber,
      end: Colors.red,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _textController.dispose();
  }

  // ! Start the shake and color animation if no stars are selected
  void shakeStars() {
    if (selected == 0) {
      _animationController.forward().then((_) {
        // ! Return to the original position and color
        _animationController.reverse();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.booking.imageUrl);
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        6.w,
        0,
        6.w,
        MediaQuery.of(context).viewInsets.bottom + 2.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CircleAvatar(
            radius: 15.w,
            backgroundImage: CachedNetworkImageProvider(
              widget.booking.imageUrl,
              errorListener: (s) => debugPrint("No Image Provided"),
            ),
            child: CustomImage(
              errorWidget: Image.asset("assets/images/doctorAvatar.png"),
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            widget.booking.name,
            style: context.bold18,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.h),
          // ! _____ START RATING STARS _____ ! //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) {
                return Row(
                  children: [
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (_, child) {
                        return Transform.translate(
                          offset: Offset(
                            _shakeAnimation.value * (index % 2 == 0 ? -1 : 1),
                            0,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selected = index + 1;
                              });
                            },
                            child: Icon(
                              index < selected ? Icons.star : Icons.star_border,
                              size: 22.sp,
                              color: index < selected
                                  ? Colors.amber
                                  : _colorAnimation.value,
                            ),
                          ),
                        );
                      },
                    ),
                    if (index < 4) SizedBox(width: 4.w),
                  ],
                );
              },
            ),
          ),
          // ! _____ END RATING STARS _____ ! //
          SizedBox(height: 2.h),
          Form(
            child: Input(
              maxLines: 5,
              controller: _textController,
              hint: "Leave a Comment (optional) ...",
            ),
          ),
          SizedBox(height: 2.h),
          BlocConsumer<AppointmentCubit, AppointmentState>(
            listener: (context, state) {
              if (state is PostFeedBackSuccess) {
                context.nav.pop();
                // showDialog(
                //   context: context,
                //   builder: (context) {},
                // );
              }
            },
            builder: (_, state) {
              return ElevatedButton(
                onPressed: () async {
                  if (selected == 0) {
                    shakeStars();
                  } else {
                    if (context.read<AppointmentCubit>().state
                        is PostFeedBackLoading) return;
                    await context.read<AppointmentCubit>().postReview(
                          rating: selected.toDouble(),
                          doctorId: widget.booking.personId,
                          content: _textController.text.trim(),
                        );
                  }
                },
                child: state is PostFeedBackLoading
                    ? const LoadingIndicator()
                    : const Text("Post Feedback"),
              );
            },
          ),
        ],
      ),
    );
  }
}
