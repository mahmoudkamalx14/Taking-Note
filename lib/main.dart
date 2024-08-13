import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/routes/app_router.dart';
import 'package:uptodo/uptodo_app.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(
    UptodoApp(appRouter: AppRouter()),
  );
}
