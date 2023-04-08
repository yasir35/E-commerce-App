import 'package:ecommerce_app/utils/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final _formKey = GlobalKey<FormState>();
  late String firstName, lastName, phone, email;
  final List<String> errors = [];
  bool remember = false;
  bool firstSubmit = false;

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
            "Profile Creation",
            style: TextStyle(
                color: Color.fromARGB(221, 240, 16, 16),
                fontFamily: 'LibreBaskerville',
                fontSize: 20,
                letterSpacing: 2,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                const Center(
                    child: Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Hi, Complete your Profile',
                    style: TextStyle(
                        color: Color.fromARGB(221, 32, 27, 27),
                        fontFamily: 'LibreBaskerville',
                        fontSize: 30,
                        letterSpacing: 3.5,
                        fontWeight: FontWeight.bold),
                  ),
                )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: TextFormField(
                    validator: (firstName) {
                      if (firstName!.isEmpty) {
                        return "Please Enter your First Name";
                      }
                      {
                        return null;
                      }
                    },
                    controller: firstNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: const Color.fromARGB(255, 255, 248, 248),
                      hintText: 'Enter your first name',
                      labelText: 'First Name',
                      suffix: const Icon(CupertinoIcons.profile_circled),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: TextFormField(
                    validator: (lastName) {
                      if (lastName!.isEmpty) {
                        return "Please Enter your Last Name";
                      }
                      {
                        return null;
                      }
                    },
                    controller: lastNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: const Color.fromARGB(255, 255, 248, 248),
                      hintText: 'Enter your last name',
                      labelText: 'Last Name',
                      suffix: const Icon(CupertinoIcons.profile_circled,
                          color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: TextFormField(
                    validator: (phone) {
                      if (phone!.isEmpty) {
                        return "Please Enter your Phone";
                      }
                      {
                        return null;
                      }
                    },
                    controller: phoneController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: const Color.fromARGB(255, 255, 248, 248),
                      hintText: 'Enter your phone number',
                      labelText: 'Phone Number',
                      suffix:
                          const Icon(CupertinoIcons.phone, color: Colors.black),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                      suffix:
                          const Icon(CupertinoIcons.mail, color: Colors.black),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(height: 40),
                InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        Navigator.pushNamed(
                          context,
                          Routename.homeScreen,
                        );
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
                        ))),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: Text(
                  'By Continuing, confirm that you agree with \n our terms and conditons',
                  style: TextStyle(
                    letterSpacing: 2,
                    fontFamily: 'SecularOne',
                    fontSize: 12,
                    color: Color.fromARGB(221, 78, 65, 65),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
