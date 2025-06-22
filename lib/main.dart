import 'package:flutter/material.dart';
import 'package:hpe_work/chatbot.dart';
//import 'package:hpe_work/screens/stable_nbrs2.dart';
//import 'package:hpe_work/data/dropdown_vals.dart';
import 'package:hpe_work/switch_screen.dart';
import 'package:hpe_work/widgets.dart/ui_colors.dart';
//import 'package:hpe_work/analytics.dart';\
//import 'package:flutter/services.dart';

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
      //home: chatbot()
    );
  }
}
