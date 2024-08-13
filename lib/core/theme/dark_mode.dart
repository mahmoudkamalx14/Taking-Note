import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/theme/color_manager.dart';

ThemeData darkTheme = ThemeData(
  textTheme: TextTheme(
    titleSmall: TextStyle(
      color: ColorManager.grey,
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
    bodySmall: TextStyle(
      color: ColorManager.white,
      fontSize: 16.sp,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
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
      foregroundColor: const WidgetStatePropertyAll(Colors.white),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
        ),
      ),
      animationDuration: const Duration(milliseconds: 300),
    ),
  ),
  scaffoldBackgroundColor: ColorManager.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorManager.black,
  ),
);
