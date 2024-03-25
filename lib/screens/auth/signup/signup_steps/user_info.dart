import 'package:flutter/material.dart';

import '../../../../shared/constants.dart';
import '../../../../shared/custom_input.dart';
import '../../../../shared/social_media.dart';

class UserInfo extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController password;
  final TextEditingController confpassword;
  const UserInfo({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confpassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Welcome!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 30),
        const SocialMedia(),
        const SizedBox(height: 30),
        const Center(
          child: Text(
            "Or Login with",
            style: TextStyle(
                color: ThemeColors.lightGrey,
                fontSize: 10,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 30),
        CustomFormInput(
          padding: 15,
          controller: name,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            if (value.length < 3) {
              return 'Please enter a valid name';
            }
            return null;
          },
          keyBoardType: TextInputType.text,
          hintText: 'Full Name',
          prefixIcon: const Image(
            image: AssetImage('assets/images/user.png'),
            height: 20,
            width: 10,
          ),
        ),
        CustomFormInput(
          padding: 15,
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
          padding: 15,
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
          keyBoardType: TextInputType.number,
          hintText: 'Phone Number',
          prefixIcon: const Image(
            image: AssetImage('assets/images/call.png'),
            height: 20,
            width: 10,
          ),
        ),
        CustomFormInput(
          padding: 15,
          controller: password,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Password';
            }
            return null;
          },
          keyBoardType: TextInputType.visiblePassword,
          hintText: 'Password',
          prefixIcon: const Image(
            image: AssetImage('assets/images/locks.png'),
            height: 10,
            width: 10,
          ),
        ),
        CustomFormInput(
          padding: 15,
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
          hintText: 'Re-enter Password',
          prefixIcon: const Image(
            image: AssetImage('assets/images/locks.png'),
            height: 10,
            width: 10,
          ),
        ),
      ],
    );
  }
}
