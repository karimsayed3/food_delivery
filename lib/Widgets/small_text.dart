import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimantions.dart';

class SmallText extends StatelessWidget {
  SmallText({
    Key? key,
    this.color = const Color(0xFF8f837f),
    required this.text,
    this.size = 0,
    this.height = 1.2,
  }) : super(key: key);

  Color color;
  final String text;
  double size;
  double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: height,
        color: color,
        fontSize: size==0 ? Dimantions.font12: size,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
