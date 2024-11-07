import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo/core/routes/routes.dart';
import 'package:uptodo/core/utils/extentions.dart';
import 'package:uptodo/core/utils/spacer.dart';
import 'package:uptodo/core/widgets/app_text_button.dart';
import 'package:uptodo/features/onboarding/data/model/onboarding_model.dart';
import 'package:uptodo/features/onboarding/data/onboarding_list.dart';

import 'smooth_page_indicator_widget.dart';

class BuildOnboardingItem extends StatefulWidget {
  const BuildOnboardingItem({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  State<BuildOnboardingItem> createState() => _BuildOnboardingItemState();
}

PageController pageController = PageController();

class _BuildOnboardingItemState extends State<BuildOnboardingItem> {
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
                    child: animation(
                      widget.currentIndex,
                      500,
                      Text(
                        'Skip',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 300.h,
                child: animation(widget.currentIndex, 200,
                    SvgPicture.asset(model[widget.currentIndex].image)),
              ),
              verticalSpace(50),
              animation(
                widget.currentIndex,
                500,
                const SmoothPageIndicatorWidget(),
              ),
              verticalSpace(50),
              animation(
                widget.currentIndex,
                300,
                Text(
                  model[widget.currentIndex].title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              verticalSpace(42),
              animation(
                widget.currentIndex,
                500,
                Text(
                  model[widget.currentIndex].body,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const Spacer(),
              animation(
                widget.currentIndex,
                200,
                Row(
                  children: [
                    if (widget.currentIndex >= 1)
                      GestureDetector(
                        onTap: () {
                          pageController.animateToPage(
                            widget.currentIndex - 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(
                          'Back',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    const Spacer(),
                    AppTextButton(
                      textButton: model[widget.currentIndex].textButton,
                      onPressed: () {
                        onDotClicked(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onDotClicked(BuildContext context) {
    if (widget.currentIndex == 2) {
      context.navigateToReplacement(Routes.navbarLayout);
    } else {
      pageController.animateToPage(
        widget.currentIndex + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  Widget animation(int index, int delay, Widget child) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }
}
