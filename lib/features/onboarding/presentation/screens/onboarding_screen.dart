import 'package:flutter/material.dart';
import 'package:uptodo/features/onboarding/data/onboarding_list.dart';
import 'package:uptodo/features/onboarding/presentation/widgets/build_onboarding_item.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) => BuildOnboardingItem(currentIndex: index),
      itemCount: onBoardingList.length,
      controller: pageController,
      physics: const BouncingScrollPhysics(),
    );
  }
}
