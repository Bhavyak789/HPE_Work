import 'package:flutter/material.dart';
import 'package:hpe_work/analytics.dart';
import 'package:hpe_work/login_page.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() {
    return _SwitchScreen();
  }
}

class _SwitchScreen extends State<SwitchScreen> {
  var activeScr = 'loginScreen';

  void switchScr() {
    setState(() {
      activeScr = 'analysisScreen';
    });
  }

  // void analytics() {
  //   setState(() {
  //     activeScr = 'analysisScreen';
  //   });
  // }

  @override
  Widget build(context) {
    Widget screen = LoginPage(switchScr);

    if (activeScr == 'analysisScreen') {
      screen = Analytics();
    }

    // if (activeScr == 'analysisScreen') {
    //   screen = GradientC(switchScr);
    // }

    return MaterialApp(home: Scaffold(body: Container(child: screen)));
  }
}
