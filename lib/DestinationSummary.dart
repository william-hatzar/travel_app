import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DestinationSummary extends StatelessWidget {
  final String name;
  final String headerImage;
  final String location;
  final String infoText;
  const DestinationSummary({Key? key, required this.name, required this.headerImage, required this.location, required this.infoText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.network(
              headerImage,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: 180, // Adjust this value to control overlap
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
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
                        Icon(Icons.location_on, color: const Color(0xff63D1D9)),
                        const SizedBox(width: 5),
                        Text(
                          location,
                          style: const TextStyle(fontWeight: FontWeight.w200, fontSize: 15, color: Color(0xff63D1D9), fontFamily: "Poppins"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star_border),
                        Text("(4)", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200))
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Description",
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black, fontFamily: "Poppins"),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      infoText,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.w200, fontSize: 15, color: Colors.grey, fontFamily: "Poppins"),
                    ),
                    SizedBox(height: 70),
                    Center(
                      child: Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xff63D1D9)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 15),
                          child:  Text("Book your experience", textAlign: TextAlign.center, style: TextStyle(fontSize: 15, color: Colors.white, fontFamily: "Poppins", fontWeight: FontWeight.w600)),
                        ),
                      ),
                    )
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
