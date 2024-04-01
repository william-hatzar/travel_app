import 'package:flutter/material.dart';

class FlightModel {
  final String airLine;
  final String flightNumber;
  final String departure;
  final String startCountry;
  final String endCountry;
  final String destination;
  final String departureTime;
  final String arrivalTime;
  final String price;
  final String imageUrl;
  final Color color;
  final String headerImage;
  final double earlyPercentage;
  final double onTimePercentage;
  final double latePercentage;
  final double cancelledPercentage;

  FlightModel(
      {required this.airLine,
      required this.flightNumber,
      required this.departure,
      required this.startCountry,
      required this.endCountry,
      required this.destination,
      required this.departureTime,
      required this.arrivalTime,
      required this.price,
      required this.imageUrl,
      required this.color,
      required this.headerImage,
      required this.earlyPercentage,
      required this.onTimePercentage,
      required this.latePercentage,
      required this.cancelledPercentage});
}
