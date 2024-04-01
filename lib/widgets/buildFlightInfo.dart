import 'package:flutter/material.dart';

Widget buildFlightInfo({
  required IconData icon,
  required String city,
  required String status,
  required String time,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(
        icon,
        size: 40,
        color: Colors.black,
      ),
      const SizedBox(width: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            city,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            status,
            style: TextStyle(
              fontFamily: "Poppins",
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontFamily: "Poppins",
              color: Colors.blueGrey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ],
  );
}