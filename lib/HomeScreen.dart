import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/DestinationSummary.dart';
import 'package:travel_app/models/FlightsModel.dart';
import 'package:travel_app/models/TripModel.dart';
import 'package:travel_app/models/TripModelSink.dart';

import 'models/FlightModelSink.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCountry;
  int? touchedIndex;
  List<Widget> stars = [];

  List<TripModel> filteredItems = [];
  List<FlightModel> flightItems = [];
  Set<String> uniqueCountries = Set();

  @override
  void initState() {
    super.initState();
    items.forEach((item) {
      uniqueCountries.add(item.country);
    });
    filteredItems = List.from(items);
    flightItems = List.from(flights); // Initialize filteredItems with all items
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Image.asset(
                  "images/ic_Hamburguer@1x.png"), // Check the image path
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundImage:
                  AssetImage('images/User@1x.png'), // Check the image path
            ),
            onPressed: () {
              // Add your action here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Dashboard",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 30,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            const Text("Your trips",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 15),
            SizedBox(
              height: 170, // Adjusted height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: flightItems.length,
                itemBuilder: (_, int index) {
                  return GestureDetector(
                    onTap: () {
                      print(flightItems[index].airLine);
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
                                      flightItems[index].imageUrl),
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
                                    "${flightItems[index].departure} -> ${flightItems[index].destination}",
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
                                        "${flightItems[index].airLine}",
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
            ),
            SizedBox(height: 40),
            const Text("Explore Places",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: uniqueCountries.length +
                    1, // Add 1 for "All" filter.length + 1, // Add 1 for "All" filter
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) {
                  if (index == 0) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCountry = null; // Reset selected continent
                          filteredItems = List.from(items); // Show all items
                        });
                      },
                      child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 8, top: 8, bottom: 8),
                          child: Container(
                              padding: EdgeInsets.only(top: 5),
                              height: 10,
                              width: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xff63D1D9),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), // shadow color
                                    spreadRadius: 2, // spread radius
                                    blurRadius: 5, // blur radius
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Text("All",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15)
                              ))
                      ),
                    );
                  } else {
                    String continent = uniqueCountries.elementAt(index - 1);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCountry = continent;
                          filteredItems = items
                              .where((item) => item.country == selectedCountry)
                              .toList();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                        child: Container(
                            padding: const EdgeInsets.only(top: 5),
                            height: 10,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xff63D1D9),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // shadow color
                                  spreadRadius: 2, // spread radius
                                  blurRadius: 5, // blur radius
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Text(continent,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15))),
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 220,
              child: ListView.builder(
                itemCount: filteredItems.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DestinationSummary(
                              name: filteredItems[index].name,
                              headerImage: filteredItems[index].headerImage,
                              location: filteredItems[index].country,
                              infoText: filteredItems[index].infoText,
                              rating: filteredItems[index].rating,
                            ),
                          ),
                        );
                      },
                      onTapDown: (_) {
                        setState(() {
                          touchedIndex = index;
                        });
                      },
                      onTapUp: (_) {
                        setState(() {
                          touchedIndex = null;
                        });
                      },
                      child: SizedBox(
                        width: 150, // Adjust the width as needed
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), // shadow color
                                    spreadRadius: 2, // spread radius
                                    blurRadius: 5, // blur radius
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(filteredItems[index].url),
                              ),
                            ),
                            const SizedBox(
                                height: 10), // Add space between image and text
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  filteredItems[index].name,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "Poppins",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
