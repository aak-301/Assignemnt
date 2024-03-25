import 'package:design/screens/auth/reset_password/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../shared/constants.dart';
import '../../../shared/custom_btn.dart';

class VerifyOtp extends StatefulWidget {
  static const String routeName = '/verify-otp';
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final _otpformKey = GlobalKey<FormState>();
  bool hasError = false;

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 14,
      color: Color(0xff735DFF),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(241, 239, 255, 1),
      border: Border.all(
        width: 2,
        color: const Color.fromARGB(24, 211, 52, 52),
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  Future<bool> _validateOtp(String otp) async {
    if (otp.length < 5) {
      setState(() {
        hasError = true;
      });
      return false;
    }

    setState(() {
      hasError = false;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
            child: Form(
              key: _otpformKey,
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
                    'Verify OTP',
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
                  Center(
                    child: Pinput(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 5) {
                          return "Please enter a valid OTP";
                        }
                        return null;
                      },
                      length: 5,
                      keyboardType: TextInputType.number,
                      cursor: Container(
                        height: 18,
                        width: 3,
                        color: const Color.fromRGBO(198, 189, 255, 1),
                      ),
                      followingPinTheme: defaultPinTheme.copyWith(
                        textStyle: defaultPinTheme.textStyle!.copyWith(
                          color: const Color(0xff735DFF),
                        ),
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: ThemeColors.inputColor,
                          border: Border.all(
                            width: 2,
                            color: ThemeColors.inputColor,
                          ),
                        ),
                      ),
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: defaultPinTheme.copyWith(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff735DFF),
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: const Color.fromRGBO(241, 239, 255, 1),
                          border: Border.all(
                            width: 2,
                            color: const Color.fromRGBO(198, 189, 255, 1),
                          ),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        textStyle: defaultPinTheme.textStyle!.copyWith(
                          color: const Color(0xff735DFF),
                        ),
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: const Color.fromRGBO(241, 239, 255, 1),
                          border: Border.all(
                            width: 2,
                            color: const Color.fromRGBO(198, 189, 255, 1),
                          ),
                        ),
                      ),
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onCompleted: (value) async {
                        bool isOtpValidated = await _validateOtp(value);
                        if (!isOtpValidated) {
                          return;
                        } else {
                          // runMutation({
                          //   'mobile': widget.mobileNumber,
                          //   'otp': value,
                          // });
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomBtn(
                    onTap: () {
                      if (_otpformKey.currentState!.validate()) {
                        Navigator.pushNamed(context, ResetPassword.routeName);
                      }
                    },
                    color: ThemeColors.primary,
                    width: double.infinity,
                    text: 'Submit',
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Resend Code",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
