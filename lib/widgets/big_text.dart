import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class BigText extends StatelessWidget {
  BigText(
      {super.key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis});
  Color color;
  final String text;
  double size;
  TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          fontSize: size == 0 ? Dimensions.font20 : size,
          color: color,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto'),
    );
  }
}
