import 'package:flutter/material.dart';

import 'constants.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 80,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: ThemeColors.socialMediaBorder),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Image(
              image: AssetImage('assets/images/gg.png'),
              height: 30,
              width: 30,
            ),
          ),
        ),
        Container(
          width: 80,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: ThemeColors.socialMediaBorder),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Image(
              image: AssetImage('assets/images/pple.png'),
              height: 30,
              width: 30,
            ),
          ),
        ),
        Container(
          width: 80,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: ThemeColors.socialMediaBorder),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Image(
              image: AssetImage('assets/images/faceb.png'),
              height: 30,
              width: 30,
            ),
          ),
        ),
      ],
    );
  }
}
