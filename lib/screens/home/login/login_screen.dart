import 'package:ecommerce_app/screens/home/login/login_controller.dart';
import 'package:ecommerce_app/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/routes_name.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  late String email, password;

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
              "Log In",
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
            padding: const EdgeInsets.only(top: 10),
            child: ChangeNotifierProvider(
                create: (_) => LoginController(),
                child: Consumer<LoginController>(
                  builder: (context, provider, child) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const Center(
                              child: Text(
                            'Welcome Back!',
                            style: TextStyle(
                                color: Color.fromARGB(221, 32, 27, 27),
                                fontSize: 40,
                                fontFamily: 'LibreBaskerville',
                                letterSpacing: 3.5,
                                fontWeight: FontWeight.bold),
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          const Center(
                              child: Text(
                            'Log in to Continue',
                            style: TextStyle(
                              letterSpacing: 2,
                              fontFamily: 'SecularOne',
                              fontSize: 15,
                              color: Color.fromARGB(221, 78, 65, 65),
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
                            height: 40,
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
                                suffixIcon:
                                    const Icon(Icons.mail, color: Colors.black),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
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
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routename.forgetPassword);
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      color: Color.fromARGB(221, 240, 16, 16),
                                      fontFamily: 'SecularOne',
                                      fontSize: 15,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  provider.login(context, emailController.text,
                                      passwordController.text);
                                  _formKey.currentState?.save();
                                  Navigator.pushNamed(
                                      context, Routename.homeScreen);
                                }
                                firstSubmit = true;
                              },
                              child: Container(
                                  width: 350,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: const Color.fromARGB(
                                          255, 244, 12, 19)),
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
                                      image: AssetImage(
                                          'assets/icons/google.png')),
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
                                      image: AssetImage(
                                          'assets/icons/twitter.png')),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35, top: 30),
                            child: Row(children: [
                              const Text(
                                'Don\'t have an account yet?',
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
                )),
          ),
        ));
  }
}
