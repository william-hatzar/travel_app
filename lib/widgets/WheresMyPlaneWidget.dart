import 'package:flutter/material.dart';
import 'buildFlightInfo.dart';

class WheresMyPlaneWidget extends StatefulWidget {
  final String startCountry;
  final String endCountry;
  final String departureTime;
  final String arrivalTime;
  const WheresMyPlaneWidget(
      {super.key,
      required this.startCountry,
      required this.endCountry,
      required this.arrivalTime,
      required this.departureTime});

  @override
  State<WheresMyPlaneWidget> createState() => _WheresMyPlaneWidgetState();
}

class _WheresMyPlaneWidgetState extends State<WheresMyPlaneWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFBCE6BF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Where's My Plane?",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Your flight's arrivals & departure timings",
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            buildFlightInfo(
              icon: Icons.flight_takeoff,
              city: widget.startCountry,
              status: "Departure time",
              time: widget.departureTime,
            ),
            const SizedBox(height: 10),
            buildFlightInfo(
              icon: Icons.flight_land,
              city: widget.endCountry,
              status: "Arrival time",
              time: widget.arrivalTime,
            ),
          ],
        ),
      ),
    );
  }
}
