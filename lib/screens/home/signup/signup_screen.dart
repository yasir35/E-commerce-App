import 'package:ecommerce_app/screens/home/signup/signup_controller.dart';
import 'package:ecommerce_app/screens/home/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../utils/routes_name.dart';
import '../../../utils/utils.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  late String email, password, confirmPassword;

  bool firstSubmit = false;
  bool remember = false;
  bool _obscureText = true;

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
            "Sign up",
            style: TextStyle(
                color: Color.fromARGB(221, 240, 16, 16),
                fontFamily: 'LibreBaskerville',
                fontSize: 20,
                letterSpacing: 2,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
            child: ChangeNotifierProvider(
              create: (_) => SignUpController(),
              child: Consumer<SignUpController>(
                builder: (context, provider, child) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        const Center(
                            child: Text(
                          'Register An Account',
                          style: TextStyle(
                              color: Color.fromARGB(221, 32, 27, 27),
                              fontFamily: 'LibreBaskerville',
                              fontSize: 30,
                              letterSpacing: 3.5,
                              fontWeight: FontWeight.bold),
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
                              } else if (!emailValidatorRegExp
                                  .hasMatch(email)) {
                                return "Please Enter Valid Email";
                              }
                              return null;
                            },
                            controller: emailController,
                            focusNode: emailFocusNode,
                            onFieldSubmitted: (value) {
                              Utils.fieldFocus(
                                  context, emailFocusNode, passwordFocusNode);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor:
                                  const Color.fromARGB(255, 255, 248, 248),
                              hintText: 'Enter Email...',
                              labelText: 'Email',
                              suffix: const Icon(CupertinoIcons.mail,
                                  color: Colors.black),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30, left: 30),
                          child: TextFormField(
                            validator: (password) {
                              if (password!.isEmpty) {
                                return "Please Enter your password";
                              } else if (password.isNotEmpty &&
                                  password.length <= 7) {
                                return "Password is too short, at least 8 chars";
                              }
                              return null;
                            },
                            controller: passwordController,
                            focusNode: passwordFocusNode,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor:
                                  const Color.fromARGB(255, 255, 248, 248),
                              hintText: 'Enter Password...',
                              labelText: 'Password',
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                    _obscureText
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30, left: 30),
                          child: TextFormField(
                            validator: (confirmPassword) {
                              if (confirmPassword != passwordController.text) {
                                return "Passwords don't match";
                              } else if (confirmPassword!.isEmpty) {
                                return "Enter confirm password";
                              }
                              return null;
                            },
                            controller: confirmPasswordController,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor:
                                  const Color.fromARGB(255, 255, 248, 248),
                              hintText: 'Repeat your Password...',
                              labelText: 'Confirm Password',
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                    _obscureText
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                provider.signup(
                                    context,
                                    emailController.text,
                                    passwordController.text,
                                    confirmPasswordController.text);
                                _formKey.currentState?.save();
                                Navigator.pushNamed(
                                    context, Routename.completeProfile);
                              }
                              firstSubmit = true;
                            },
                            child: Container(
                                width: 350,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    color:
                                        const Color.fromARGB(255, 244, 12, 19)),
                                child: const Center(
                                  child: Text(
                                    'Sign Up',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'SecularOne',
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                width: 120,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 228, 219, 219),
                                  shape: BoxShape.circle,
                                ),
                                child: const Image(
                                    image: AssetImage(
                                        'assets/icons/facebook.png')),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                width: 120,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 228, 219, 219),
                                  shape: BoxShape.circle,
                                ),
                                child: const Image(
                                    image:
                                        AssetImage('assets/icons/google.png')),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                width: 120,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 228, 219, 219),
                                  shape: BoxShape.circle,
                                ),
                                child: const Image(
                                    image:
                                        AssetImage('assets/icons/twitter.png')),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35, top: 20),
                          child: Row(children: [
                            const Text(
                              'Already have an account?',
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
                                    context, Routename.loginScreen);
                              },
                              child: const Text('Login',
                                  style: TextStyle(
                                      fontFamily: 'SecularOne',
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ]),
                        )
                      ],
                    ),
                  );
                },
              ),
            )),
      ),
    );
  }
}
