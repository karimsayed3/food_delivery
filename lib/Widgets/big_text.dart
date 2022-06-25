import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
   BigText({
    Key? key,
    required this.color,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 20
  }) : super(key: key);

  final Color color;
  final String text;
  double size;
  TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
