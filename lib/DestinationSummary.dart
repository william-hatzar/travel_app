import 'package:flutter/material.dart';
import 'package:travel_app/widgets/DestinationContentBuilder.dart';
import 'package:travel_app/widgets/HeaderImage.dart';

class DestinationSummary extends StatefulWidget {
  final String name;
  final String headerImage;
  final String location;
  final String infoText;
  final int rating;

  const DestinationSummary(
      {super.key,
      required this.name,
      required this.headerImage,
      required this.location,
      required this.infoText,
      required this.rating});

  @override
  State<DestinationSummary> createState() => _DestinationSummaryState();
}

class _DestinationSummaryState extends State<DestinationSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HeaderImage(headerImage: widget.headerImage),
          Positioned(
            top: 180, // Adjust this value to control overlap
            left: 0,
            right: 0,
            child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                ),
                padding: const EdgeInsets.all(16.0),
                child: DestinationContentBuilder(
                    destinationName: widget.name,
                    location: widget.location,
                    rating: widget.rating,
                    infoText: widget.infoText)),
          ),
        ],
      ),
    );
  }
}
