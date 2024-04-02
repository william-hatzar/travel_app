import 'package:flutter/material.dart';
import 'package:travel_app/constants/Constants.dart';
import 'package:travel_app/widgets/ArrivalTimeWidget.dart';
import 'package:travel_app/widgets/FlightTopRowWidget.dart';
import 'package:travel_app/widgets/WheresMyPlaneWidget.dart';

class FlightSummary extends StatefulWidget {
  final String departure;
  final String destination;
  final String startCountry;
  final String endCountry;
  final String departureTime;
  final String arrivalTime;
  final double earlyPercentage;
  final double onTimePercentage;
  final double latePercentage;
  final double canceledPercentage;

  const FlightSummary(
      {super.key,
      required this.departure,
      required this.destination,
      required this.startCountry,
      required this.endCountry,
      required this.arrivalTime,
      required this.departureTime,
      required this.earlyPercentage,
      required this.onTimePercentage,
      required this.latePercentage,
      required this.canceledPercentage});

  @override
  State<FlightSummary> createState() => _FlightSummaryState();
}

class _FlightSummaryState extends State<FlightSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD3F6D6),
      appBar: AppBar(
        backgroundColor: Color(0xFFD3F6D6),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text(
          flightDetails,
          style: TextStyle(
              fontFamily: fontFamily, fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
           FlightRowTopWidget(
              text1: from,
              text2: to,
              fontSize: 16,
              textColor: Colors.blueGrey,
              fontWeight: FontWeight.w600),
          const SizedBox(height: 5),
          FlightRowTopWidget(
              text1: widget.departure,
              text2: widget.destination,
              fontSize: 22,
              textColor: Colors.black,
              fontWeight: FontWeight.w600),
          const SizedBox(height: 5),
          FlightRowTopWidget(
              text1: widget.startCountry,
              text2: widget.endCountry,
              fontSize: 18,
              textColor: Colors.black),
          const SizedBox(height: 20),
          WheresMyPlaneWidget(
              startCountry: widget.startCountry,
              endCountry: widget.endCountry,
              arrivalTime: widget.arrivalTime,
              departureTime: widget.departureTime),
          const SizedBox(height: 30),
          ArrivalTimeWidget(
              earlyPercentage: widget.earlyPercentage,
              onTimePercentage: widget.onTimePercentage,
              latePercentage: widget.latePercentage,
              canceledPercentage: widget.canceledPercentage)
        ]),
      ),
    );
  }
}
