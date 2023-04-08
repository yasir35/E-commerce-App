import 'package:ecommerce_app/screens/complete_profile.dart';
import 'package:ecommerce_app/screens/home/forget_password/forget_password.dart';
import 'package:ecommerce_app/screens/home/cart/add_to_cart.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/screens/intro_screen.dart';
import 'package:ecommerce_app/screens/home/login/login_screen.dart';
import 'package:ecommerce_app/screens/login_success.dart';
import 'package:ecommerce_app/screens/home/signup/signup_screen.dart';
import 'package:ecommerce_app/screens/splash_screen.dart';
import 'package:ecommerce_app/utils/routes_name.dart';
import 'package:flutter/material.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routename.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routename.introScreen:
        return MaterialPageRoute(builder: (context) => const IntroPage());
      case Routename.loginScreen:
        return MaterialPageRoute(builder: (context) => const LogIn());
      case Routename.signupScreen:
        return MaterialPageRoute(builder: (context) => const SignUp());
      case Routename.forgetPassword:
        return MaterialPageRoute(builder: (context) => const ForgetPassword());
      case Routename.loginSccess:
        return MaterialPageRoute(builder: (context) => const LoginSuccess());
      case Routename.completeProfile:
        return MaterialPageRoute(builder: (context) => const CompleteProfile());
      case Routename.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case Routename.cartPage:
        return MaterialPageRoute(builder: (context) => const CartPage());
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(child: Text('No route defined')),
            );
          },
        );
    }
  }
}
