import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:travel_app/widgets/progressbar.dart';
import 'models/FlightsModel.dart';
import 'widgets/buildFlightInfo.dart';

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
        title: const Text(
          "Flight Details",
          style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          const Row(
            children: [
              Text(
                "From",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                "To",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                widget.departure,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                widget.destination,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                widget.startCountry,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              Text(
                widget.endCountry,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
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
                  Text(
                    "Where's My Plane?",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
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
          ),
          const SizedBox(height: 30),
          Container(
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
                      "Arrival time?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontSize: 30,
                      ),
                    ),
                   const SizedBox(height: 5),
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
                    ProgressBar(title: "Early", percentage: widget.earlyPercentage),
                    const SizedBox(height: 10),
                    ProgressBar(title: "On time", percentage: widget.onTimePercentage),
                    const SizedBox(height: 10),
                    ProgressBar(title: "Late", percentage: widget.latePercentage),
                    const SizedBox(height: 10),
                    ProgressBar(title: "Cancelled ", percentage: widget.canceledPercentage),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
