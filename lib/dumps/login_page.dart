import 'package:flutter/material.dart';
//import 'package:hpe_ui/analytics.dart';

class LoginPage extends StatelessWidget {
  const LoginPage(this.analysis, {super.key});

  final void Function() analysis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //const Color.fromARGB(226, 54, 54, 57),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 169, 130),
        title: Row(
          children: [
            const Text(
              'HPE Network Analytics',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle login action
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 1, 169, 130),
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 64,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 16, fontFamily: 'Readex Pro'),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 190),
              child: Center(
                child: Image.asset(
                  'assets/images/hpe_logo.png',
                  width: 960,
                  height: 242,
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Log in to HPE Analytics',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Readex Pro',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Username',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Readex Pro',
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 448,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Username',
                  hintStyle: const TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Color.fromARGB(137, 23, 22, 22),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Password',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Readex Pro',
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 448,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Color.fromARGB(137, 23, 22, 22),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: analysis,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 1, 169, 130),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 64,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Log in',
                style: TextStyle(fontSize: 16, fontFamily: 'Readex Pro'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
