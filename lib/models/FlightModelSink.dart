import 'package:travel_app/models/FlightsModel.dart';
import "package:flutter/material.dart";

List<FlightModel> flights = [
  FlightModel(airLine: "Ryanair",
      flightNumber: "EK202", departure: "DXB", destination: "JFK", departureTime: "10:00 AM", arrivalTime: "4:00 PM", price: "1200", imageUrl: "images/ryanAir.png", cardColor: Colors.yellow),
  FlightModel(airLine: "Easy Jet",
      flightNumber: "EK202", departure: "DXB", destination: "JFK", departureTime: "10:00 AM", arrivalTime: "4:00 PM", price: "1200", imageUrl: "images/easyjet.png", cardColor: Colors.orange),
  FlightModel(airLine: "British Airways",
      flightNumber: "EK202", departure: "DXB", destination: "JFK", departureTime: "10:00 AM", arrivalTime: "4:00 PM", price: "1200", imageUrl: "images/BritishAirways.png", cardColor: Colors.blue),
FlightModel(airLine: "Wizz Air",
      flightNumber: "EK202", departure: "DXB", destination: "JFK", departureTime: "10:00 AM", arrivalTime: "4:00 PM", price: "1200", imageUrl: "images/wizzAir.png", cardColor: Colors.purple),

];