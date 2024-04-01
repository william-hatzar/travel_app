import 'package:flutter/material.dart';
import 'package:travel_app/widgets/progressbar.dart';

class ArrivalTimeWidget extends StatelessWidget {
  final double earlyPercentage;
  final double onTimePercentage;
  final double latePercentage;
  final double canceledPercentage;
  const ArrivalTimeWidget({Key? key, required this.earlyPercentage, required this.onTimePercentage, required this.latePercentage, required this.canceledPercentage}) : super(key: key);

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
              ProgressBar(title: "Early", percentage: earlyPercentage),
              const SizedBox(height: 10),
              ProgressBar(title: "On time", percentage: onTimePercentage),
              const SizedBox(height: 10),
              ProgressBar(title: "Late", percentage: latePercentage),
              const SizedBox(height: 10),
              ProgressBar(title: "Cancelled ", percentage: canceledPercentage),
            ],
          ),
        ));
  }
}
