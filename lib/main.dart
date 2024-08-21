import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/di/dependency_injection.dart';
// import 'package:uptodo/core/di/dependency_injection.dart';
import 'package:uptodo/core/routes/app_router.dart';
import 'package:uptodo/note_taking_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(
    NoteTakingApp(appRouter: AppRouter()),
  );
}
