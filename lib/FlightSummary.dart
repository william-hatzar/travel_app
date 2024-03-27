import 'package:flutter/material.dart';


class FlightSummary extends StatefulWidget {
  final String airline;
  final String departure;
  final String destination;

  const FlightSummary({super.key, required this.airline, required this.departure, required this.destination});

  @override
  State<FlightSummary> createState() => _FlightSummaryState();
}

class _FlightSummaryState extends State<FlightSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff002059),
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Image.network(
              "https://tellmamauk.org/wp-content/uploads/2018/10/RyanAir-2.jpg",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth, // Adjust the BoxFit as per your preference
            ),
          ),
          Positioned(
            top: 240,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.departure} -> ${widget.destination}",
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 25, color: Colors.black, fontFamily: "Poppins"),
                        ),
                         Text(
                          widget.airline,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Color(0xff63D1D9), fontFamily: "Poppins"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
