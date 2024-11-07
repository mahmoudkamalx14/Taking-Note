import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:uptodo/core/routes/routes.dart';
import 'package:uptodo/core/utils/extentions.dart';
import 'package:uptodo/features/home/presentation/screens/notes_screen.dart';
import 'package:uptodo/features/home/presentation/screens/tasks_screen.dart';

class NavbarLayout extends StatefulWidget {
  const NavbarLayout({super.key});

  @override
  State<NavbarLayout> createState() => _NavbarLayoutState();
}

class _NavbarLayoutState extends State<NavbarLayout> {
  int _currentIndex = 0;

  final iconList = <IconData>[
    Icons.list_alt_sharp,
    Icons.note_alt_outlined,
  ];

  final screens = <Widget>[
    const TasksScreen(),
    const NotesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: screens[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        animatedIconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF5F33DF),
        overlayOpacity: 0.5,
        animationDuration: const Duration(milliseconds: 500),
        overlayColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: const IconThemeData(color: Colors.white),
        children: [
          SpeedDialChild(
            child: const Icon(Icons.list_alt_sharp, color: Colors.white),
            backgroundColor: const Color(0xFF5F33DF),
            labelBackgroundColor: const Color(0xFF5F33DF),
            labelStyle: const TextStyle(color: Colors.white),
            label: 'Task',
            onTap: () {
              context.pop();
              context.navigateTo(Routes.addTasksScreen);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.note_alt_outlined, color: Colors.white),
            backgroundColor: const Color(0xFF5F33DF),
            labelBackgroundColor: const Color(0xFF5F33DF),
            label: 'Note',
            labelStyle: const TextStyle(color: Colors.white),
            onTap: () {
              context.pop();
              context.navigateTo(Routes.addNotesScreen);
            },
          ),
        ],
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 32.w,
        rightCornerRadius: 32.w,
        iconSize: 48,
        height: 90.h,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
        activeColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
        inactiveColor:
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
