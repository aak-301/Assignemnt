import 'package:design/screens/auth/signup/signup.dart';
import 'package:design/shared/constants.dart';
import 'package:design/shared/custom_btn.dart';
import 'package:design/shared/custom_input.dart';
import 'package:flutter/material.dart';

import '../../../shared/social_media.dart';
import '../reset_password/forgot_password.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'FarmerEats',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 80),
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      const Text(
                        'New Here?',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.grey2),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, Signup.routeName),
                        child: const Text(
                          ' Create Account',
                          style: TextStyle(
                            color: ThemeColors.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
                  CustomFormInput(
                    controller: email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid Email';
                      }
                      return null;
                    },
                    keyBoardType: TextInputType.emailAddress,
                    hintText: 'Email Address',
                    prefixIcon: const Image(
                      image: AssetImage('assets/images/rate.png'),
                      height: 20,
                      width: 10,
                    ),
                  ),
                  CustomFormInput(
                    controller: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your PAssword';
                      }
                      return null;
                    },
                    keyBoardType: TextInputType.visiblePassword,
                    suffixIcon: SizedBox(
                      width: 70,
                      height: 25,
                      child: Center(
                        child: GestureDetector(
                          child: const Text(
                            "Forgot ?",
                            style: TextStyle(
                                color: ThemeColors.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, ForgotPassword.routeName);
                          },
                        ),
                      ),
                    ),
                    hintText: 'Password',
                    prefixIcon: const Image(
                      image: AssetImage('assets/images/locks.png'),
                      height: 10,
                      width: 10,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomBtn(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // signupUser();
                      }
                    },
                    color: ThemeColors.primary,
                    width: double.infinity,
                    text: 'Login',
                  ),
                  const SizedBox(height: 35),
                  const Center(
                    child: Text(
                      "Or Login with",
                      style: TextStyle(
                          color: ThemeColors.lightGrey,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 35),
                  const SocialMedia(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
