import 'package:flutter/material.dart';
import 'package:midterm_examination_advanced_mobile_programming_app/app/constants/app_colors.dart';
import 'package:midterm_examination_advanced_mobile_programming_app/app/pages/home_page.dart';

void main() {
  runApp(const MidtermExaminationAdvancedMobileProgrammingApp());
}

class MidtermExaminationAdvancedMobileProgrammingApp extends StatelessWidget {
  const MidtermExaminationAdvancedMobileProgrammingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS Pemrograman Mobile Lanjut',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
