import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  SmallText(
      {super.key,
      this.color = const Color(0xFFccc7c5),
      required this.text,
      this.size = 12,
      this.height = 1.2});
  Color color;
  final String text;
  double size;
  double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size, height: height, color: color, fontFamily: 'Roboto'),
    );
  }
}
