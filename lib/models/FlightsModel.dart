import 'package:flutter/material.dart';

class FlightModel {
  final String airLine;
  final String flightNumber;
  final String departure;
  final String destination;
  final String departureTime;
  final String arrivalTime;
  final String price;
  final String imageUrl;
  final Color cardColor;

  FlightModel({required this.airLine, required this.flightNumber, required this.departure, required this.destination, required this.departureTime, required this.arrivalTime, required this.price, required this.imageUrl, required this.cardColor});

}
