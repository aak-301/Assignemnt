import 'package:flutter/material.dart';

import '../../../shared/constants.dart';
import '../../../shared/custom_btn.dart';
import '../../../shared/custom_input.dart';

class ResetPassword extends StatefulWidget {
  static const String routeName = '/reset-password';

  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController password = TextEditingController();
  TextEditingController confpassword = TextEditingController();
  final _resetPassformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _resetPassformKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
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
                    'Reset Password',
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
                  const SizedBox(height: 50),
                  CustomFormInput(
                    controller: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Password';
                      }
                      return null;
                    },
                    keyBoardType: TextInputType.visiblePassword,
                    hintText: 'New Password',
                    prefixIcon: const Image(
                      image: AssetImage('assets/images/locks.png'),
                      height: 20,
                      width: 10,
                    ),
                  ),
                  CustomFormInput(
                    controller: confpassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Password';
                      }
                      if (password.text.isNotEmpty &&
                          password.text != confpassword.text) {
                        return 'Passwrd is not same';
                      }
                      return null;
                    },
                    keyBoardType: TextInputType.visiblePassword,
                    hintText: 'Confirm New Password',
                    prefixIcon: const Image(
                      image: AssetImage('assets/images/locks.png'),
                      height: 20,
                      width: 10,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomBtn(
                    onTap: () {
                      if (_resetPassformKey.currentState!.validate()) {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      }
                    },
                    color: ThemeColors.primary,
                    width: double.infinity,
                    text: 'Submit',
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
