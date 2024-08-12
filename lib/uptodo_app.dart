import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/routes/app_router.dart';
import 'package:uptodo/core/routes/routes.dart';
import 'package:uptodo/core/theme/dark_mode.dart';
import 'package:uptodo/core/theme/light_mode.dart';

class UptodoApp extends StatelessWidget {
  const UptodoApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return ScreenUtilInit(
      designSize: Size(width, height),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onboardingScreen,
          onGenerateRoute: appRouter.generateRoute,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.dark,
        );
      },
    );
  }
}
