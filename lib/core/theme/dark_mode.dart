import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/theme/color_manager.dart';

ThemeData darkTheme = ThemeData(
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: ColorManager.white,
      fontSize: 20.sp,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      color: ColorManager.white,
      fontSize: 16.sp,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      color: ColorManager.white,
      fontSize: 32.sp,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      height: 0,
    ),
    bodyMedium: TextStyle(
      color: ColorManager.white,
      fontSize: 20.sp,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      height: 0,
    ),
    bodySmall: TextStyle(
      color: ColorManager.white,
      fontSize: 16.sp,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      color: ColorManager.white,
      fontSize: 20.sp,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w500,
      height: 0,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w)),
      fixedSize: WidgetStatePropertyAll(Size(double.infinity, 48.h)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      backgroundColor: WidgetStateProperty.all(
        const Color(0xFF8874FF),
      ),
      animationDuration: const Duration(milliseconds: 300),
    ),
  ),
  cardColor: const Color(0xFF363636),
  canvasColor: const Color(0xFF8874FF),
  iconTheme: const IconThemeData(color: Colors.white),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF363636),
    selectedItemColor: Color(0xFF5F33DF),
    unselectedItemColor: Color(0xFFB49FF2),
  ),
  scaffoldBackgroundColor: ColorManager.black,
  primaryColor: const Color(0xFF8874FF),
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorManager.black,
  ),
);
