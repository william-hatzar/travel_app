import 'package:flutter/material.dart';

class SubheadingWidget extends StatelessWidget {
  final String title;
  const SubheadingWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 20,
            fontWeight: FontWeight.w600));
  }
}
