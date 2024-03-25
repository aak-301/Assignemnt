import 'package:flutter/material.dart';
import 'custom_onboarding.dart';

class Onboarding extends StatefulWidget {
  static const String routeName = '/onboarding';

  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  final List<Map> _onboardinglist = [
    {
      'heading': 'Quality',
      'message':
          'Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain.',
      'color': const Color(0xff5EA25F),
      'image': 'assets/images/onboarding1.png',
    },
    {
      'heading': 'Convenient',
      'message':
          'Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.',
      'color': const Color(0xffD5715B),
      'image': 'assets/images/onboarding2.png',
    },
    {
      'heading': 'Local',
      'message':
          'We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time.',
      'color': const Color(0xffF8C569),
      'image': 'assets/images/onboarding3.png',
    },
  ];

  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animation = IntTween(begin: 0, end: 2).animate(
      CurvedAnimation(
          parent: _controller,
          curve: Curves.easeIn,),
    )..addListener(() {
        setState(() {});
      });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomOnboarding(
      data: _onboardinglist[_animation.value],
      activeIdx: _animation.value,
    );
  }
}

