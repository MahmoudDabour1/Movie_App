import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_with_clean/core/resources/color_manager.dart';
import 'package:movies_with_clean/core/services/services_locator.dart';

import 'bottom_bar/bottom_bar_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(376, 813),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: ColorManager.gray,
              useMaterial3: true,
            ),
            home:  BottomBarScreen(),
          );
        });
  }
}
