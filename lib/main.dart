import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:student_app_1/controllers/init_controllers.dart';
import 'package:student_app_1/core/styles/colors.dart';
import 'package:student_app_1/views/home_screen.dart';

void main() {
  runApp(StudentApp());
}

class StudentApp extends StatelessWidget {
  StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitControllers(),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        progressIndicatorTheme: ProgressIndicatorThemeData(color: CustomColors.primaryColor.shade100,circularTrackColor: CustomColors.primaryColor),
        brightness: Brightness.dark, // Use the dark theme
        fontFamily: 'outfit', // Set your custom font here
        primaryColor: CustomColors.primaryColor,
        primaryColorDark: CustomColors.primaryColor,
        primaryColorLight: CustomColors.primaryColor,
        hintColor: CustomColors.primaryColor,
        scaffoldBackgroundColor: bgPrimary,
      ),
    );
  }
}
