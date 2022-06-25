import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  SmallText({
    Key? key,
    this.color = const Color(0xFF89dad0),
    required this.text,
    this.size = 12,
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
        fontSize: size,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
