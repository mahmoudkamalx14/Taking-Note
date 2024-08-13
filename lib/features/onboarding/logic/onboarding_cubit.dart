import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/features/onboarding/logic/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  static OnboardingCubit get(context) => BlocProvider.of(context);

  PageController pageController = PageController();

  int index = 0;

  void emitOnboardingBackState() {
    index--;
    emit(OnboardingBackState());
  }

  void emitOnboardingForwordState() {
    index++;
    emit(OnboardingForwordState());
  }
}
