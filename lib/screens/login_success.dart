import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/routes_name.dart';

class LoginSuccess extends StatefulWidget {
  const LoginSuccess({super.key});

  @override
  State<LoginSuccess> createState() => _LoginSuccessState();
}

class _LoginSuccessState extends State<LoginSuccess> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1500), () {
      Navigator.pushNamed(context, Routename.completeProfile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(children: [
        Image.asset(
          'assets/images/Ls.png',
        ),
        const Center(
            child: Text(
          'Login Success',
          style: TextStyle(
              color: Color.fromARGB(221, 32, 27, 27),
              fontFamily: 'LibreBaskerville',
              fontSize: 40,
              letterSpacing: 3.5,
              fontWeight: FontWeight.bold),
        )),
        const SizedBox(height: 30),
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routename.completeProfile);
            },
            child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: const Color.fromARGB(255, 244, 12, 19)),
                child: const Center(
                  child: Text(
                    'Back to home',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'LibreBaskerville',
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ))),
      ]),
    ));
  }
}
