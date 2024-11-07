import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uptodo/features/onboarding/data/onboarding_list.dart';
import 'package:uptodo/features/onboarding/presentation/widgets/build_onboarding_item.dart';

class SmoothPageIndicatorWidget extends StatelessWidget {
  const SmoothPageIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: onBoardingList.length,
      axisDirection: Axis.horizontal,
      effect: SlideEffect(
        spacing: 8.0,
        radius: 8.0,
        dotWidth: 26.0.w,
        dotHeight: 4.0.h,
        paintStyle: PaintingStyle.fill,
        strokeWidth: 1.5,
        dotColor: const Color(0xFF999999),
        activeDotColor: const Color(0xFF8874FF),
      ),
      onDotClicked: (index) {
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      },
    );
  }
}
