import 'package:ecommerce_app/screens/home/forget_password/forget_password_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/routes_name.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  late String email;
  bool firstSubmit = false;
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => {Navigator.of(context).pop()},
            ),
            title: const Text(
              "Forget Password",
              style: TextStyle(
                  color: Color.fromARGB(221, 240, 16, 16),
                  fontFamily: 'LibreBaskerville',
                  fontSize: 20,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: ChangeNotifierProvider(
            create: (_) => ForgetPasswordController(),
            child: Consumer<ForgetPasswordController>(
              builder: (context, provider, child) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      const Center(
                          child: Text(
                        'Forget Password',
                        style: TextStyle(
                            color: Color.fromARGB(221, 32, 27, 27),
                            fontFamily: 'LibreBaskerville',
                            fontSize: 40,
                            letterSpacing: 3.5,
                            fontWeight: FontWeight.bold),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                          child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Please enter your email and we will send \n you a link to return to your account',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontFamily: 'SecularOne',
                            fontSize: 15,
                            color: Color.fromARGB(221, 78, 65, 65),
                          ),
                        ),
                      )),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset(
                        'assets/images/1.png',
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30, left: 30),
                        child: TextFormField(
                          validator: (email) {
                            if (email!.isEmpty) {
                              return "Please Enter your email";
                            } else if (!emailValidatorRegExp.hasMatch(email)) {
                              return "Please Enter Valid Email";
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: const Color.fromARGB(255, 255, 248, 248),
                            hintText: 'Enter Email',
                            labelText: 'Email',
                            suffix: const Icon(CupertinoIcons.mail),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(height: 30),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            provider.forgotPassword(
                              context,
                              emailController.text,
                            );
                            _formKey.currentState?.save();
                            Navigator.pushNamed(context, Routename.loginScreen);
                          }
                          firstSubmit = true;
                        },
                        child: Container(
                            width: 350,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: const Color.fromARGB(255, 244, 12, 19)),
                            child: const Center(
                              child: Text(
                                'Continue',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'LibreBaskerville',
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35, top: 20),
                        child: Row(children: [
                          const Text(
                            'Dont have an account yet?',
                            style: TextStyle(
                              fontFamily: 'SecularOne',
                              letterSpacing: 1.3,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routename.signupScreen);
                            },
                            child: const Text('Sign Up',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontFamily: 'SecularOne',
                                    fontWeight: FontWeight.bold)),
                          ),
                        ]),
                      ),
                    ]),
                  ),
                );
              },
            ),
          )),
    );
  }
}
