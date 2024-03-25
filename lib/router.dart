import 'package:design/screens/auth/login/login.dart';
import 'package:design/screens/auth/reset_password/forgot_password.dart';
import 'package:design/screens/auth/reset_password/reset_password.dart';
import 'package:design/screens/auth/reset_password/verify_otp.dart';
import 'package:design/screens/auth/signup/signup.dart';
import 'package:design/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Onboarding.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: ((_) {
          return const Onboarding();
        }),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: ((_) {
          return const LoginScreen();
        }),
      );
    case ForgotPassword.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: ((_) {
          return const ForgotPassword();
        }),
      );
    case VerifyOtp.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: ((_) {
          return const VerifyOtp();
        }),
      );
    case ResetPassword.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: ((_) {
          return const ResetPassword();
        }),
      );
    case Signup.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: ((_) {
          return const Signup();
        }),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: ((_) {
          return const Scaffold(
            body: Center(
              child: Text('Something went wrong'),
            ),
          );
        }),
      );
  }
}
