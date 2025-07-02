import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app_2/core/database/database_helper.dart';
import 'package:meal_app_2/core/model/data.dart';
import 'package:meal_app_2/feature/home_screen/home_screen.dart';
import 'package:meal_app_2/feature/onboarding/onboarding_screen.dart';
import 'package:meal_app_2/feature/onboarding/onboarding_service/onboarding_service.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OnboardingService.initShaerdpreferencesStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Meal App',
          home: OnboardingScreen(),
        );
      },
    );
  }
}
