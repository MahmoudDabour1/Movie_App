import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_with_clean/bottom_bar/bottom_bar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> BottomBarScreen()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffB91825),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/img.png", width: 110, height: 126),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Watch Time",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
