import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/theme/color_manager.dart';

ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
    titleSmall: TextStyle(
      color: ColorManager.black,
      fontSize: 16.sp,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      color: ColorManager.black,
      fontSize: 32.sp,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      height: 0,
    ),
    bodySmall: TextStyle(
      color: ColorManager.black,
      fontSize: 16.sp,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
);
