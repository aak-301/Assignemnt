import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final Color color;
  final double width;
  final String text;
  final VoidCallback onTap;
  const CustomBtn({
    super.key,
    required this.color,
    required this.width,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
