import "package:flutter/material.dart";

Widget returnStars(int filledStars, int totalStars) {
  List<Widget> stars = [];

  for (int i = 0; i < filledStars; i++) {
    stars.add(
      Icon(
        Icons.star,
        size: 24,
        color: Color(0xff63D1D9),
      ),
    );
  }

  for (int i = 0; i < totalStars - filledStars; i++) {
    stars.add(
      Icon(
        Icons.star_border,
        size: 24,
        color: Color(0xff63D1D9),
      ),
    );
  }
  return Row(
    children: stars,
  );
}