import 'package:flutter/material.dart';
//import 'package:hpe_work/widgets.dart/ui_colors.dart';
//import 'package:hpe_ui/analytics.dart';

class LoginPage extends StatelessWidget {
  const LoginPage(this.analysis, {super.key});

  final void Function() analysis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(8, 56, 48, 1),
        title: const Text(
          'HPE Network Analytics',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/BG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 150),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(height: 75),
                    Image.asset(
                      'assets/images/hpe_logo.png',
                      width: 750,
                      height: 250,
                    ),
                  ],
                ),
                const SizedBox(width: 60),
                Container(
                  height: 400,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // color: const Color.fromRGBO(247, 247, 247, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Log in to HPE Analytics',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Username',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Readex Pro',
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Username',
                            hintStyle: const TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Color.fromARGB(137, 23, 22, 22),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Readex Pro',
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Color.fromARGB(137, 23, 22, 22),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: analysis,
                            // todo - Handle login action
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                1,
                                169,
                                130,
                              ),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 71,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Readex Pro',
                              ),
                            ),
                          ),
                          SizedBox(width: 18),
                          ElevatedButton(
                            onPressed: () {
                              // todo - Handle SignUp action
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Color.fromARGB(255, 1, 169, 130),
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 64,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: Color.fromARGB(255, 1, 169, 130),
                                  width: 1.5,
                                ),
                              ),
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Readex Pro',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
