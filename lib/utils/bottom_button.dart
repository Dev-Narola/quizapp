import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  final Color? color;
  final String text;
  final Icon icon;
  final double? width;
  final double? size;
  const ButtonContainer({
    super.key,
    this.color = Colors.blue,
    required this.text,
    required this.icon,
    this.width = 230,
    this.size = 25,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size,
                  fontWeight: FontWeight.w500),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
