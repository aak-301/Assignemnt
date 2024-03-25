import 'package:flutter/material.dart';

import '../../../../shared/constants.dart';
import '../../../../shared/custom_btn.dart';

class Conformation extends StatelessWidget {
  const Conformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 120,
          child: const Column(
            children: [
              SizedBox(height: 120),
              Center(
                  child: Image(image: AssetImage("assets/images/ticks.png"))),
              SizedBox(height: 50),
              Text(
                'You’re all done!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Hang tight! We are currently reviewing your account and will follow up with you in 2-3 business days. In the meantime, you can setup your inventory.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ThemeColors.grey2),
              ),
            ],
          ),
        ),
        CustomBtn(
          onTap: () {},
          color: ThemeColors.primary,
          width: MediaQuery.of(context).size.width,
          text: 'Continue',
        ),
      ],
    );
  }
}
