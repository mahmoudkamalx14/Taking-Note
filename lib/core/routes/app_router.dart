import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/di/dependency_injection.dart';
import 'package:uptodo/core/function/build_page_route.dart';
import 'package:uptodo/core/routes/routes.dart';
import 'package:uptodo/features/home/logic/note_cubit.dart';
import 'package:uptodo/features/home/presentation/screens/add_note_screen.dart';
import 'package:uptodo/features/home/presentation/screens/add_task_screen.dart';
import 'package:uptodo/features/home/presentation/screens/navbar_layout.dart';
import 'package:uptodo/features/home/presentation/screens/notes_screen.dart';
import 'package:uptodo/features/home/presentation/screens/tasks_screen.dart';
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

      case Routes.tasksScreen:
        return smoothEaseInOutPageRoute(
          const TasksScreen(),
          settings: settings,
        );

      case Routes.notesScreen:
        return smoothEaseInOutPageRoute(
          const NotesScreen(),
          settings: settings,
        );

      case Routes.addTasksScreen:
        return smoothEaseInOutPageRoute(
          const AddTaskScreen(),
          settings: settings,
        );

      case Routes.addNotesScreen:
        return smoothEaseInOutPageRoute(
          BlocProvider(
            create: (context) => NoteCubit(getIt()),
            child: const AddNoteScreen(),
          ),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
