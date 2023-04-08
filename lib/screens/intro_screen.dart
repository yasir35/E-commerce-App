import 'package:ecommerce_app/utils/routes_name.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/1.png',
                height: 170,
                width: 170,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Ebuy",
                style: TextStyle(
                    color: Color.fromARGB(221, 240, 16, 16),
                    fontFamily: 'LibreBaskerville',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                    "An ecommerce app with an intuitive and highly\n functional build can help online stores boost\n their sales. We play a pretty big part in our daily\n lives, especially when it comes to shopping online.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontStyle: FontStyle.italic, fontFamily: 'SecularOne')),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routename.loginScreen);
                  },
                  child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: const Color.fromARGB(255, 244, 12, 19)),
                      child: const Center(
                        child: Text(
                          'Log In',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'LibreBaskerville',
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ))),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routename.signupScreen);
                },
                child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: const Color.fromARGB(255, 244, 12, 19)),
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'LibreBaskerville',
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
