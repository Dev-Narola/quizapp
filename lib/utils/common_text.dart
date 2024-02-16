import 'package:flutter/material.dart';

class Common extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight weight;
  const Common(
      {super.key,
      required this.text,
      this.color,
      this.size,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
