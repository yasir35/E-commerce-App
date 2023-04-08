import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 1200),
      () {
        Navigator.pushNamed(context, Routename.introScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ebuy",
          style: TextStyle(
              color: Color.fromARGB(221, 240, 16, 16),
              fontFamily: 'LibreBaskerville',
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Image.asset('assets/images/3.png'),
    );
  }
}
