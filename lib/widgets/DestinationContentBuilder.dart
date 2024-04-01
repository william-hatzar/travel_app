import 'package:flutter/material.dart';
import 'package:travel_app/utils/ratings_builder.dart';

class DestinationContentBuilder extends StatelessWidget {
  final String destinationName;
  final String location;
  final int rating;
  final String infoText;
  const DestinationContentBuilder({super.key, required this.destinationName, required this.location, required this.rating, required this.infoText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                destinationName,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 25, color: Colors.black, fontFamily: "Poppins"),
              ),
              const Text(
                "£250",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Color(0xff63D1D9), fontFamily: "Poppins"),
              ),
            ],
          ),
          const SizedBox(height: 5), //
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, color: const Color(0xff63D1D9)),
              const SizedBox(width: 5),
              Text(
                location,
                style: const TextStyle(fontWeight: FontWeight.w200, fontSize: 15, color: Color(0xff63D1D9), fontFamily: "Poppins"),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              returnStars(rating, 5)
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Description",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black, fontFamily: "Poppins"),
          ),
          const SizedBox(height: 15),
          Text(
            infoText,
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.w200, fontSize: 15, color: Colors.grey, fontFamily: "Poppins"),
          ),
          const SizedBox(height: 70),
          Center(
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xff63D1D9)
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 13),
                child:  Text("Book now", textAlign: TextAlign.center, style: TextStyle(fontSize: 17, color: Colors.white, fontFamily: "Poppins", fontWeight: FontWeight.w600)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
