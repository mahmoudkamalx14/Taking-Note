import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/function/build_page_route.dart';
import 'package:uptodo/core/routes/routes.dart';
import 'package:uptodo/features/home/presentation/screens/navbar_layout.dart';
import 'package:uptodo/features/onboarding/logic/onboarding_cubit.dart';
import 'package:uptodo/features/onboarding/presentation/screens/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final String routeName = settings.name!;

    switch (routeName) {
      case Routes.onboardingScreen:
        return smoothEaseInOutPageRoute(
          BlocProvider(
            create: (context) => OnboardingCubit(),
            child: const OnboardingScreen(),
          ),
          settings: settings,
        );

      case Routes.navbarLayout:
        return smoothEaseInOutPageRoute(
          const NavbarLayout(),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
