import 'package:flutter/material.dart';

class FlightRowTopWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final double fontSize;
  final Color textColor;
  final FontWeight? fontWeight;

  const FlightRowTopWidget({super.key, required this.text1, required this.text2, required this.fontSize, required this.textColor, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: fontSize,
            color: textColor,
            fontWeight: fontWeight,
          ),
        ),
        const Spacer(),
        Text(
          text2,
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: fontSize,
            color: textColor,
            fontWeight: fontWeight
          ),
        ),
      ],
    );
  }
}

