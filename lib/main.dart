import 'package:flutter/material.dart';
import 'package:hpe_work/switch_screen.dart';
import 'package:hpe_work/widgets.dart/ui_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HPE Network Analysis',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor:
              AppColors.primary, //const Color.fromARGB(255, 41, 209, 52),
        ),
      ),
      home: SwitchScreen(),
    );
  }
}
