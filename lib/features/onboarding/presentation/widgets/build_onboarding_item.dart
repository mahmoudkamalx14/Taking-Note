import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo/core/routes/routes.dart';
import 'package:uptodo/core/utils/extentions.dart';
import 'package:uptodo/core/utils/spacer.dart';
import 'package:uptodo/core/widgets/app_text_button.dart';
import 'package:uptodo/features/onboarding/data/model/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uptodo/features/onboarding/data/onboarding_list.dart';
import 'package:uptodo/features/onboarding/logic/onboarding_cubit.dart';

class BuildOnboardingItem extends StatelessWidget {
  const BuildOnboardingItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> model = onBoardingList;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 38.h),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () =>
                        context.navigateToReplacement(Routes.navbarLayout),
                    child: Text(
                      'Skip',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 300.h,
                child: SvgPicture.asset(model[index].image),
              ),
              verticalSpace(50),
              SmoothPageIndicator(
                controller: OnboardingCubit.get(context).pageController,
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
              ),
              verticalSpace(50),
              Text(
                model[index].title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              verticalSpace(42),
              Text(
                model[index].body,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Spacer(),
              Row(
                children: [
                  if (index >= 1)
                    GestureDetector(
                      onTap: () {
                        OnboardingCubit.get(context).emitOnboardingBackState();
                      },
                      child: Text(
                        'Back',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  const Spacer(),
                  AppTextButton(
                    textButton: model[index].textButton,
                    onPressed: () {
                      if (index == 2) {
                        context.navigateToReplacement(Routes.navbarLayout);
                      } else {
                        OnboardingCubit.get(context)
                            .emitOnboardingForwordState();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
