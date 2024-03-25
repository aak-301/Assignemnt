import 'package:design/screens/auth/reset_password/verify_otp.dart';
import 'package:flutter/material.dart';

import '../../../shared/constants.dart';
import '../../../shared/custom_btn.dart';
import '../../../shared/custom_input.dart';

class ForgotPassword extends StatefulWidget {
  static const String routeName = '/forgot-passowrd';
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      const Text(
                        'Remember your password?',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.grey2),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: const Text(
                          ' Login',
                          style: TextStyle(
                            color: ThemeColors.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 80),
                  CustomFormInput(
                    controller: phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (value.substring(0, 1) != '+') {
                        return "Please enter the country code";
                      }
                      if (value.length < 12) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                    hintText: 'Phone Number',
                    prefixIcon: const Image(
                      image: AssetImage('assets/images/call.png'),
                      height: 20,
                      width: 10,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomBtn(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, VerifyOtp.routeName);
                      }
                    },
                    color: ThemeColors.primary,
                    width: double.infinity,
                    text: 'Send Code',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
