import 'package:flutter/material.dart';
import 'package:hpe_work/screens/login_Pg2.dart';
//import 'package:hpe_work/screens/analytics.dart';
import 'package:hpe_work/screens/stable_nbrs2.dart';
// import 'package:hpe_work/dumps/stable_nbrs.dart';

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
      screen = StableNbrs();
      //fetchUniq().fetchList();
    }

    // if (activeScr == 'analysisScreen') {
    //   screen = GradientC(switchScr);
    // }

    return MaterialApp(home: Scaffold(body: Container(child: screen)));
  }
}
