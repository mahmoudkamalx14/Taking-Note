import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/features/onboarding/data/onboarding_list.dart';
import 'package:uptodo/features/onboarding/logic/onboarding_cubit.dart';
import 'package:uptodo/features/onboarding/logic/onboarding_state.dart';
import 'package:uptodo/features/onboarding/presentation/widgets/build_onboarding_item.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        var cubit = OnboardingCubit.get(context);

        return PageView.builder(
          itemBuilder: (context, index) =>
              BuildOnboardingItem(index: cubit.index),
          itemCount: onBoardingList.length,
          controller: cubit.pageController,
          physics: const NeverScrollableScrollPhysics(),
        );
      },
    );
  }
}
