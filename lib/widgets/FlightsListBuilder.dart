import 'package:flutter/material.dart';
import 'package:travel_app/FlightSummary.dart';

import '../models/FlightsModel.dart';

class FlightsListViewBuilder extends StatefulWidget {
  FlightsListViewBuilder({Key? key, required this.flightItems}) : super(key: key);

  List<FlightModel> flightItems = [];

  @override
  State<FlightsListViewBuilder> createState() => _FlightsListViewBuilderState();
}

class _FlightsListViewBuilderState extends State<FlightsListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.flightItems.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => FlightSummary(
                        departure: widget.flightItems[index].departure,
                        destination: widget.flightItems[index].destination,
                        startCountry:
                        widget.flightItems[index].startCountry,
                        endCountry: widget.flightItems[index].endCountry,
                        departureTime:
                        widget.flightItems[index].departureTime,
                        arrivalTime: widget.flightItems[index].arrivalTime,
                        earlyPercentage: widget.flightItems[index].earlyPercentage,
                        onTimePercentage: widget.flightItems[index].onTimePercentage,
                        latePercentage: widget.flightItems[index].latePercentage,
                        canceledPercentage: widget.flightItems[index].cancelledPercentage,
                      )));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                margin: EdgeInsets.only(bottom: 8.0),
                width: 210.0, // Width remains the same
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset:
                      Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height:
                      90, // Adjusted height for the image container
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage(
                              widget.flightItems[index].imageUrl),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.flightItems[index].departure} -> ${widget.flightItems[index].destination}",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Poppins",
                              fontSize: 14, // Font size adjusted
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                              height: 2), // Reduced space between text
                          Row(
                            children: [
                              Icon(
                                Icons.flight,
                                color: Colors.grey,
                                size: 16, // Icon size adjusted
                              ),
                              SizedBox(width: 4),
                              Text(
                                "${widget.flightItems[index].airLine}",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Poppins",
                                  fontSize: 14, // Font size adjusted
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
