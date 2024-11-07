import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/di/dependency_injection.dart';
import 'package:uptodo/core/function/build_page_route.dart';
import 'package:uptodo/core/routes/routes.dart';
import 'package:uptodo/features/home/presentation/logic/note/note_cubit.dart';
import 'package:uptodo/features/home/presentation/logic/theme/theme_cubit.dart';
import 'package:uptodo/features/home/presentation/screens/add_note_screen.dart';
import 'package:uptodo/features/home/presentation/screens/add_task_screen.dart';
import 'package:uptodo/features/home/presentation/screens/navbar_layout.dart';
import 'package:uptodo/features/home/presentation/screens/notes_screen.dart';
import 'package:uptodo/features/home/presentation/screens/tasks_screen.dart';
import 'package:uptodo/features/onboarding/presentation/screens/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final String routeName = settings.name!;

    switch (routeName) {
      case Routes.onboardingScreen:
        return fadePageRoute(const OnboardingScreen());

      case Routes.navbarLayout:
        return fadePageRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => NoteCubit(getIt())..readAllNotes(),
              ),
              BlocProvider(
                create: (context) => ThemeCubit(),
              ),
            ],
            child: const NavbarLayout(),
          ),
        );

      case Routes.tasksScreen:
        return smoothEaseInOutPageRoute(
          BlocProvider(
            create: (context) => ThemeCubit(),
            child: const TasksScreen(),
          ),
          settings: settings,
        );

      case Routes.notesScreen:
        return smoothEaseInOutPageRoute(
          BlocProvider(
            create: (context) => NoteCubit(getIt()),
            child: const NotesScreen(),
          ),
          settings: settings,
        );

      case Routes.addTasksScreen:
        return smoothEaseInOutPageRoute(
          const AddTaskScreen(),
          settings: settings,
        );

      case Routes.addNotesScreen:
        return fadePageRoute(BlocProvider(
          create: (context) => NoteCubit(getIt()),
          child: const AddNoteScreen(),
        ));

      default:
        return null;
    }
  }
}
