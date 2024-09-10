import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:booking_clinics/feature/Auth/data/onboarding_content.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'signin.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    SizedBox(
                      width: 100.w,
                      height: 67.h,
                      child: Image.asset(
                        contents[i].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Flexible(
                      child: Text(
                        contents[i].title,
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff374151)),
                      ),
                    ),
                    SizedBox(height: 1.5.h),
                    Text(
                      contents[i].discription,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15.sp, color:const  Color(0xff6B7280)),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                        (index) => buildDot(index, context),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Evaluated button
          Container(
            height: 6.h,
            margin:const  EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.dark,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                  currentIndex == contents.length - 1 ? "Continue" : "Next",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )),
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SignIn(),
                    ),
                  );
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                }
              },
            ),
          ),
          // Skip button (Only show when not on the last page)
          if (currentIndex != contents.length - 1)
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>const  SignIn(),
                  ),
                );
              },
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.grey, fontSize: 17.sp),
              ),
            ),
          SizedBox(height: 1.5.h), // Adjust for spacing at the bottom
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 40 : 10,
      margin:const  EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? MyColors.dark : ConstColor.textBtn.color,
      ),
    );
  }
}
