import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final String title;
  final double percentage;
  const ProgressBar({super.key, required this.title, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,),
        SizedBox(height: 5),
        LinearProgressIndicator(
          value: percentage,
          backgroundColor: const Color(0xff99B89C),
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
          minHeight: 8,
          borderRadius: BorderRadius.circular(20),
        ),
      ],
    );
  }
}
