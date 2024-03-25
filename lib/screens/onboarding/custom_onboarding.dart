import 'package:design/screens/auth/signup/signup.dart';
import 'package:design/shared/custom_btn.dart';
import 'package:flutter/material.dart';

import '../auth/login/login.dart';

class CustomOnboarding extends StatelessWidget {
  final Map data;
  final int activeIdx;
  const CustomOnboarding({
    super.key,
    required this.data,
    required this.activeIdx,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: data['color']),
        child: Column(
          children: [
            Image.asset(
              data['image'],
              height: 400,
              width: double.infinity,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(49),
                    topRight: Radius.circular(49),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        data['heading'],
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        data['message'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: activeIdx == 0 ? 20 : 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xff261C12),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: activeIdx == 1 ? 20 : 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xff261C12),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: activeIdx == 2 ? 20 : 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xff261C12),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomBtn(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Signup.routeName);
                        },
                        color: data['color'],
                        width: MediaQuery.of(context).size.width / 2,
                        text: "Join the movement!",
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
